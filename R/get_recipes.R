source("update_url.R")
source("get_recipes_links.R")
source("get_recipe_info.R")

get_recipes <- function(difficulty = "", cooking_time = "", diet = "",
                        ingredient = "", cooking_method = ""){
  
  print("Generating query...")
  
  url <- "https://www.giallozafferano.it/ricette-cat/?search_query="
  
  if (difficulty == "facile"){
    url <- update(url, "&difficolta%5Bfacile%5D=1")
  }
  else if (difficulty == "media"){
    url <- update(url, "&difficolta%5Bmedia%5D=1")
  }
  else if (difficulty == "difficile"){
    url <- update(url, "&difficolta%5Bdifficile%5D=1")
  }
  
  if (cooking_time == 15){
    url <- update(url, "&tempo_preparazione=15")
  }
  else if (cooking_time == 30){
    url <- update(url, "&tempo_preparazione=30")
  }
  else if (cooking_time == 60){
    url <- update(url, "&tempo_preparazione=60")
  }
  
  if (diet == "light"){
    url <- update(url, "&benessere%5Bbenessere-light%5D=1")
  }
  else if (diet == "senza_glutine"){
    url <- update(url, "&benessere%5Bbenessere-senza-glutine%5D=1")
  }
  else if (diet == "senza_lattosio"){
    url <- update(url, "&benessere%5Bbenessere-senza-lattosio%5D=1")
  }
  else if (diet == "vegetariano") {
    url <- "https://www.giallozafferano.it/ricette-cat/Vegetariani/"
  }
  
  if (ingredient == "pesce"){
    url <- "https://www.giallozafferano.it/ricette-cat/Pesce/"
  }
  else if (ingredient == "frutta"){
    url <- "https://www.giallozafferano.it/ricette-cat/Frutta/"
  }
  else if (ingredient == "carne"){
    url <- "https://www.giallozafferano.it/ricette-cat/Carne/"
  }
  else if (ingredient == "formaggio"){
    url <- "https://www.giallozafferano.it/ricette-cat/Formaggio/"
  }
  
  if (cooking_method == "al_forno"){
    url <- "https://www.giallozafferano.it/ricette-cat/Al-forno/"
  }
  else if (cooking_method == "piatti_freddi"){
    url <- "https://www.giallozafferano.it/ricette-cat/Piatti-Freddi/"
  }
  else if (cooking_method == "fritti"){
    url <- "https://www.giallozafferano.it/ricette-cat/Fritti/"
  }
  
  search_url <- url
  links <- get_recipes_links(search_url)
  
  recipes <- list()
  
  for(link in links){
    recipe <- get_recipe_info(link)
    recipes <- append(recipes, recipe)
  }
  
  print("Creating dataframe...")
  
  df.recipes <- do.call(rbind.data.frame, recipes)
  colnames(df.recipes) <- c("url", "title", "category", "rating",
                            "calories_per_serving", "difficulty",
                            "preparation_time", "cooking_time", "price")
  
  print("Done.")
  
  return(df.recipes)
}
