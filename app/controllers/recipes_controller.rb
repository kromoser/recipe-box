class RecipesController < ApplicationController


  get '/recipes' do
    confirm_logged_in
    @user = current_user
    @recipes = @user.recipes.all
    erb :'/recipes/index'
  end

  get '/recipes/new' do 
    confirm_logged_in
    @ingredients = current_user.ingredients.uniq
    @types = current_user.types.uniq
    #@ingredients = users_ingredients(current_user).flatten.uniq
    #@types = users_types(current_user).flatten.uniq
    erb :'/recipes/create'
  end

  post '/recipes' do 
    @recipe = Recipe.create(params[:recipe])
    if !params[:ingredient][:name].empty?
      @recipe.ingredients << Ingredient.find_or_create_by(name: params[:ingredient][:name])
    end
    if !params[:type][:name].empty?
      @recipe.types << Type.find_or_create_by(name: params[:type][:name])
    end
    
    recipe_validation(@recipe, "new")
  end

  get '/recipes/:id' do
    confirm_logged_in
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.all
    @types = @recipe.types.all
    erb :'/recipes/show'
  end

  get '/recipes/:id/edit' do 
    confirm_logged_in
    @recipe = Recipe.find(params[:id])
    @ingredients = current_user.ingredients.uniq
    @types = current_user.types.uniq
    #@ingredients = users_ingredients(current_user).flatten.uniq
    #@types = users_types(current_user).flatten.uniq
    if current_user.recipes.include?(@recipe)
      erb :'/recipes/edit'
    else 
      flash[:message] = "That's not your recipe! You can only edit your own recipes."
      redirect to "/recipes/#{@recipe.id}"
    end
  end

  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.update(params[:recipe])
    if !params[:ingredient][:name].empty?
      recipe.ingredients << Ingredient.find_or_create_by(name: params[:ingredient][:name])
    end
    if !params[:type][:name].empty?
      recipe.types << Type.find_or_create_by(name: params[:type][:name])
    end
    
    recipe_validation(recipe, "edit", recipe.id)

  end

  delete '/recipes/:id' do 
    confirm_logged_in
    recipe = Recipe.find(params[:id])
    if current_user.recipes.include?(recipe)
      recipe.delete
      flash[:message] = "Recipe deleted"
      redirect to "/recipes"
    else

      # THOUGHT: Perhaps I should dynamically change the style
      # of the edit/delete buttons and make them unclickable instead
      # of raising an error message.

      flash[:message] = "That's not your recipe. You can only delete your own recipes!"
      redirect to "/recipes/#{recipe.id}"
    end
  end


end