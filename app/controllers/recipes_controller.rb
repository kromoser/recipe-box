class RecipesController < ApplicationController


  get '/recipes' do
    @user = current_user

    erb :'/recipes/index'

  end

  get '/recipes/new' do 
    erb :'/recipes/create_recipe'
  end

  post '/recipes' do 
    @recipe = Recipe.create(params[:recipe])
    if !params[:ingredient][:name].empty?
      @recipe.ingredients << Ingredient.create(name: params[:ingredient][:name])
    end
    if !params[:type][:name].empty?
      @recipe.types << Type.create(name: params[:type][:name])
    end
    @recipe.save
    current_user.recipes << @recipe
    redirect to "/recipes"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :'/recipes/show'
  end

end