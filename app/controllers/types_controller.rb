class TypesController < ApplicationController

  get '/categories' do 
    confirm_logged_in
    @user = current_user
    @categories = users_types(current_user).flatten
    erb :'/categories/index'
  end

  get '/categories/:id' do
    confirm_logged_in
    @category = Type.find(id: params[:id])
    @recipes = @category.recipes.select do |recipe|
      recipe.user == current_user
    end 

    erb :'/categories/show'


end