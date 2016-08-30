class IngredientsController < ApplicationController

  get '/ingredients' do 
    confirm_logged_in
    @user = current_user
    erb :'/ingredients/index'
  end


end