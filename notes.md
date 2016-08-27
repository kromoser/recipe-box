Recipe Box

A recipe organizer for my favorite recipes culled from around the web.

Models:

User:
  A user has many recipes
  A user has a username
  A user has an email address
  A user has a password
Recipe:
  A recipe has many ingredients
  A recipe has many categories
  A recipe has a name
  A recipe has a link
  A recipe has a cooking time
Ingredient:
  An ingredient has many recipes
  An ingredient has a name
Category:
  A category has many recipes
  A category has a name

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
  Users & Recipes (recipes belong_to a user)
  Recipes & Ingredients (has_many to has_many; need a join table)
  Recipes & Categories (has_many to has_many; another join table)



