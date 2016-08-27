class RecipesController < ApplicationController

  get '/recipes' do
    @user = current_user
    erb :'/recipes/index'
  end

  get '/recipes/new' do 
    erb :'/recipes/create_recipe'
  end

end