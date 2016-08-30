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
    -display all of a user's recipes
    -display recipes by key ingredient
    -display recipes by category
    -display recipes by cooking time
  edit recipes
  delete recipes

Relationships:
  Users & Recipes (recipes belong_to a user)
  Recipes & Ingredients (has_many to has_many; need a join table)
  Recipes & Categories (has_many to has_many; another join table)

CODE SMELL OBSERVATIONS:

[x] if !logged_in? checks
[ ] finder methods (maybe these could be metaprogrammed to use the same finder with each class?)

QUESTIONS FOR ASSESSMENT:

- If I want to find all recipes that belong to/have an ingredient && that belong to current_user, what is the best way to do that? I read that the way I did it is slow and inefficient if there are a lot of records. What is the better way. Using something like ActiveRecord's #where with SQL queries???
- Is there a way to always pass current_user as an instance variable without having to set it in every route?


