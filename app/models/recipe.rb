class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_types
  has_many :types, through: :recipe_types
end