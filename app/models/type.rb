class Type < ActiveRecord::Base
  has_many :recipe_types
  has_many :recipes, through: :recipe_types
end