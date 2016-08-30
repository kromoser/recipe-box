class IngredientsController < ApplicationController

  get '/ingredients' do 
    confirm_logged_in
    @user = current_user
    @ingredients = users_ingredients(current_user).flatten
    erb :'/ingredients/index'
  end

  get '/ingredients/:id' do
    confirm_logged_in
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes
    erb :'/ingredients/show'
  end 


end