class IngredientsController < ApplicationController

  get '/ingredients' do 
    confirm_logged_in
    @user = current_user
    @ingredients = all_users_ingredients(current_user).flatten

    erb :'/ingredients/index'
  end



end