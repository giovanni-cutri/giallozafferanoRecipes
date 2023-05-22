source("update_url.R")
source("get_recipes_links.R")
source("get_recipe_info.R")

get_recipes <- function(category = "", difficulty = "", cooking_time = "", diet = "",
                        ingredient = "", cooking_method = ""){
  
  print("Generating query...")
  
  url <- "https://www.giallozafferano.it/ricette-cat/"
  
  if (category == "antipasti"){
    url <- update(url, "Antipasti/")
  }
  
  else if (category == "primi"){
    url <- update(url, "Primi/")
  }
  
  else if (category == "pasta"){
    url <- update(url, "Primi/pasta/")
  }
  
  else if (category == "pasta_fresca"){
    url <- update(url, "Primi/Pasta-fresca/")
  }
  
  else if (category == "gnocchi"){
    url <- update(url, "Primi/Gnocchi/")
  }
  
  else if (category == "riso_cereali"){
    url <- update(url, "Primi/riso-cereali/")
  }
  
  else if (category == "zuppe_minestre_vellutate"){
    url <- update(url, "Primi/zuppe-minestre-vellutate/")
  }
  
  else if (category == "secondi"){
    url <- update(url, "Secondi-piatti/")
  }
  
  else if (category == "piatti_unici"){
    url <- update(url, "Piatti-Unici/")
  }
  
  else if (category == "dolci"){
    url <- update(url, "Dolci-e-Desserts/")
  }
  
  else if (category == "torte"){
    url <- update(url, "Dolci-e-Desserts/Torte/")
  }
  
  else if (category == "al_cucchiaio"){
    url <- update(url, "Dolci-e-Desserts/Al-cucchiaio/")
  }
  
  else if (category == "biscotti"){
    url <- update(url, "Dolci-e-Desserts/Biscotti/")
  }
  
  else if (category == "gelati_sorbetti_semifreddi"){
    url <- update(url, "Dolci-e-Desserts/Gelati-e-Semifreddi/")
  }
  
  else if (category == "salse_creme"){
    url <- update(url, "Dolci-e-Desserts/Salse-e-Creme/")
  }
  
  else if (category == "piccola_pasticceria"){
    url <- update(url, "Dolci-e-Desserts/piccola-pasticceria/")
  }
  
  else if (category == "cheesecake"){
    url <- update(url, "Dolci-e-Desserts/Cheesecakes/")
  }
  
  else if (category == "contorni"){
    url <- update(url, "Contorni/")
  }
  
  else if (category == "insalate"){
    url <- update(url, "Insalate/")
  }
  
  else if (category == "torte_salate"){
    url <- update(url, "Torte-salate/")
  }
  
  else if (category == "lievitati"){
    url <- update(url, "Lievitati/")
  }
  
  else if (category == "pizze_focacce"){
    url <- update(url, "Lievitati/Pizze-e-focacce/")
  }
  
  else if (category == "pane"){
    url <- update(url, "Lievitati/pane/")
  }
  
  else if (category == "lievitati_dolci"){
    url <- update(url, "Lievitati/Dolci/")
  }
  
  else if (category == "salse_sughi"){
    url <- update(url, "Salse-e-Sughi/")
  }
  
  else if (category == "sughi"){
    url <- update(url, "Salse-e-Sughi/Sughi/")
  }
  
  else if (category == "salse_condimenti"){
    url <- update(url, "Salse-e-Sughi/Salse-e-condimenti/")
  }
  
  else if (category == "marmellate_conserve"){
    url <- update(url, "Marmellate-e-Conserve/")
  }
  
  else if (category == "marmellate"){
    url <- update(url, "Marmellate-e-Conserve/Marmellate/")
  }
  
  else if (category == "conserve"){
    url <- update(url, "Marmellate-e-Conserve/Conserve/")
  }
  
  else if (category == "bevande"){
    url <- update(url, "Bevande/")
  }
  
  else if (category == "analcolici"){
    url <- update(url, "Bevande/Analcolici/")
  }
  
  else if (category == "alcolici"){
    url <- update(url, "Bevande/Alcolici/")
  }
  
  else if (category == "frappe_frullati"){
    url <- update(url, "Bevande/frappe-frullati/")
  }
  
  url <- update(url, "?search_query=")
  
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
