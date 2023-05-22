library(rvest)

get_recipe_info <- function(url) {
  recipe_page <- read_html(url)
  
  title <- recipe_page %>%
    html_elements(css = "meta[property='og:title']") %>%
    html_attr("content")
  
  category <- recipe_page %>%
    html_elements(css = ".gz-breadcrumb ul a") %>%
    html_text
  
  rating <- recipe_page %>%
    html_elements(css = "#rating_panel_top") %>%
    html_attr("data-content-rate")

  calories_per_serving <- recipe_page %>%
    html_elements(css = ".gz-text-calories-total span") %>%
    html_text %>% .[[1]]
  
  data <- recipe_page %>%
    html_elements(css = ".gz-name-featured-data strong")
  
  difficulty <- data[1] %>% html_text
  preparation_time <- data[2] %>% html_text
  cooking_time <- data[3] %>% html_text
  price <- data[5] %>% html_text
  
  info <- c(title, category, rating, calories_per_serving,
            difficulty, preparation_time, cooking_time, price)
  
  return(info)
}
