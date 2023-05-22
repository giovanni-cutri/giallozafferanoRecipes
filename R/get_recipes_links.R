library(rvest)

get_recipes_links <- function(url) {

  recipes_links <- c()

  while(!identical(url, character(0))){
    recipes_page <- read_html(url)
    recipes <- recipes_page %>%
      html_elements(css = ".gz-title a") %>%
      html_attr("href")
    recipes_links <- append(recipes_links, recipes)
    next_page <- recipes_page %>%
      html_elements(css = ".next") %>%
      html_attr("href")
    url <- next_page
  }

  return(recipes_links)
}
