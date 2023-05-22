library(rvest)

get_recipes_links <- function(url) {

  print("Getting recipes links...")

  recipes_links <- c()

  count <- 1

  # loop until the last page
  while(!identical(url, character(0))){
    recipes_page <- read_html(url)
    recipes <- recipes_page %>%
      html_elements(css = ".gz-title a") %>%
      html_attr("href")
    recipes_links <- append(recipes_links, recipes)
    next_page <- recipes_page %>%
      html_elements(css = ".next") %>%
      html_attr("href")
    # if it is the first iteration, get the total number of pages
    if (count == 1){
      total_pages <- recipes_page %>%
        html_element(css = ".total-pages") %>%
        html_text()
      # if the total number of pages is not displayed, it can still be obtained
      if (is.na(total_pages)) {
        total_pages <- recipes_page %>%
          html_elements(css = ".gz-pages a") %>%
          length()
      }

    }
    print(paste("Page", count, "of", total_pages, "..."))
    url <- next_page
    count <- count + 1
  }

  print(paste("Found", length(recipes_links), "recipes."))

  return(recipes_links)
}
