class IngredientsController < ApplicationController

  get '/ingredients' do 
    confirm_logged_in
    @user = current_user
    @ingredients = @user.recipes.collect do |recipe| 
      recipe.ingredients
    end

    erb :'/ingredients/index'
  end



end