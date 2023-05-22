library(rvest)
library(stringr)

get_recipe_info <- function(url, current, total) {

  recipe_page <- read_html(url)

  title <- ""
  tryCatch(
    expr = {
      title <- recipe_page %>%
        html_elements(css = "meta[property='og:title']") %>%
        html_attr("content")
      print(paste("Parsing '", title, "' (", current, "/", total, ")", "...", sep = ""))
    },
    error = function(e){
      title <<- NA
    }
  )

  category <- ""
  tryCatch(
    expr = {
      category <- recipe_page %>%
        html_elements(css = ".gz-breadcrumb ul li:not(.gz-creators-tag) a") %>%
        html_text %>% paste(collapse = ", ")
    },
    error = function(e){
      category <<- NA
    }
  )

  rating <- ""
  tryCatch(
    expr = {
      rating <- recipe_page %>%
        html_elements(css = "#rating_panel_top") %>%
        html_attr("data-content-rate")
    },
    error = function(e){
      rating <<- NA
    }
  )

  calories_per_serving <- ""
  tryCatch(
    expr = {
      calories_per_serving <- recipe_page %>%
        html_elements(css = ".gz-text-calories-total span") %>%
        html_text %>% .[[1]]
    },
    error = function(e){
      calories_per_serving <<- NA
    }
  )

  misc_data <- ""
  tryCatch(
    expr = {
      misc_data <- recipe_page %>%
        html_elements(css = ".gz-name-featured-data") %>% html_text()
    },
    error = function(e){
      misc_data <<- NA
    }
  )

  difficulty <- ""
  tryCatch(
    expr = {
      for (i in misc_data){
        if (grepl("Difficoltà", i)){
          difficulty <- i %>% str_split(": ") %>% .[[1]] %>% .[2]
          break
        }
      }
    },
    error = function(e){
      difficulty <<- NA
    }
  )

  preparation_time <- ""
  tryCatch(
    expr = {
      for (i in misc_data){
        if (grepl("Preparazione", i, fixed = TRUE)){
          preparation_time <- i %>% str_split(": ") %>% .[[1]] %>% .[2]
          break
        }
      }
    },
    error = function(e){
      preparation_time <<- NA
    }
  )

  cooking_time <- ""
  tryCatch(
    expr = {
      for (i in misc_data){
        if (grepl("Cottura", i, fixed = TRUE)){
          cooking_time <- i %>% str_split(": ") %>% .[[1]] %>% .[2]
          break
        }
      }
    },
    error = function(e){
      cooking_time <<- NA
    }
  )

  price <- ""
  tryCatch(
    expr = {
      for (i in misc_data){
        if (grepl("Costo: ", i, fixed = TRUE)){
          price <- i %>% str_split(": ") %>% .[[1]] %>% .[2]
          break
        }
      }
    },
    error = function(e){
      price <<- NA
    }
  )

  info <- list(c(url, title, category, rating, calories_per_serving, difficulty,
            preparation_time, cooking_time, price))

  return(info)
}
