% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_recipes.R
\name{get_recipes}
\alias{get_recipes}
\title{Get recipes from GialloZafferano website}
\usage{
get_recipes(
  category = "",
  difficulty = "",
  cooking_time = "",
  diet = "",
  ingredient = "",
  cooking_method = "",
  special = ""
)
}
\arguments{
\item{category}{The recipe's category, as noted on the website}

\item{difficulty}{The recipe's difficulty ("facile", "medio", "difficile")}

\item{cooking_time}{The recipe's cooking time (15, 30 or 60 minutes)}

\item{diet}{A healthy feature of the recipe (light, senza_glutine,
senza_lattosio, vegetariano)}

\item{ingredient}{A particular ingredient of the recipe (pesce, frutta,
carne, formaggio)}

\item{cooking_method}{The recipe's cooking method (al_forno, piatti_freddi, fritti)}

\item{special}{A special category the recipe belongs to, selected by the website}
}
\value{
A dataframe with info about the recipes
}
\description{
This function gets several arguments from the user regarding the recipes
they are looking for and scrapes GialloZafferano to obtain them.
All of the arguments are optional. If the user does not pass any arguments,
all the recipes of the website will be scraped.
}
\examples{
get_recipes(category = "primi", difficulty = "facile")

}
