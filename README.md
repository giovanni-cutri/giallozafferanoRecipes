# giallozafferano-recipes
A handy tool to scrape recipes from the Italian website GialloZafferano, written in R.

You can filter by difficulty, cooking time, ingredients and other fields.

The result is a dataframe containing all of the recipes which you can use to set up a personal cooking plan.

# Installation

Install directly from GitHub.

```
install.packages("devtools")
devtools::install_github("giovanni-cutri/giallozafferano-recipes")
````

# Usage

````
library(giallozafferrano-recipes)

get_recipes(...)
````
Using ````get_recipes()```` alone will scrape the entire website with all of the recipes.
You can apply filters to the search by passing one or more of the following parameters.

````
Available parameters

category            The recipe's category, as noted on the website
difficulty          The recipe's difficulty ("facile", "medio", "difficile")                              
cooking_time        The recipe's cooking time (15, 30 or 60 minutes)
diet                A healthy feature of the recipe (light, senza_glutine, senza_lattosio, vegetariano)
ingredient          A particular ingredient of the recipe (pesce, frutta, carne, formaggio)
cooking_method      The recipe's cooking method (al_forno, piatti_freddi, fritti)
special             A special category the recipe belongs to, selected by the website
````

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/giovanni-cutri/giallozafferano-recipes/blob/master/LICENSE) file for details.
