update <- function(url, option){
  new_url <- paste(url, option)
  return(new_url)
}

filter_recipes <- function(difficulty, cooking_time, diet, ingredient,
                           cooking_method) {
  
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
  
  return(url)
}