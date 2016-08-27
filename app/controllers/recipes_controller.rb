class RecipesController < ApplicationController

  get '/recipes' do
    @user = current_user
    erb :'/recipes/index'
  end

end