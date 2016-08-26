Recipe Box

A recipe organizer for my favorite recipes culled from around the web.

Models:

Recipe:
  A recipe has many ingredients
  A recipe has many categories
  A recipe has a name
  A recipe has a link
  A recipe has a cooking time
Ingredient:
  An ingredient has many recipes
Category:
  A category has many recipe

The app will be able to:
  create recipes
  display recipes:
    -display all recipes
    -display recipes by key ingredient
    -display recipes by category
    -display recipes by cooking time
  edit recipes
  delete recipes

Relationships:
  Recipes & Ingredients (has_many to has_many; need a join table)
  Recipes & Categories (has_many to has_many; another join table)



