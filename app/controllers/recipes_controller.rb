class RecipesController < ApplicationController


  get '/recipes' do
    if logged_in?
      @user = current_user
      erb :'/recipes/index'
    else
      flash[:message] = "Please log in first"
      redirect to "/"
    end
  end

  get '/recipes/new' do 
    if logged_in?
      erb :'/recipes/create'
    else
      flash[:message] = "Please log in first"
      redirect to "/"
    end
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

    if @recipe.save
      current_user.recipes << @recipe
      redirect to "/recipes"
    else
      flash[:message] = @recipe.errors.full_messages
      redirect to "/recipes/new"
    end
  end

  get '/recipes/:id' do
    if logged_in?
      @recipe = Recipe.find(params[:id])
      erb :'/recipes/show'
    else
      flash[:message] = "Please log in first"
      redirect to "/"
    end
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    if logged_in? && current_user.recipes.include?(@recipe)
      erb :'/recipes/edit'
    elsif !logged_in?
      flash[:message] = "Please log in first"
      redirect to "/"
    else 
      flash[:message] = "That's not your recipe! You can only edit your own recipes."
      redirect to "/recipes"
    end
  end

  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.update(params[:recipe])
    if !params[:ingredient][:name].empty?
      recipe.ingredients << Ingredient.create(name: params[:ingredient][:name])
    end
    if !params[:type][:name].empty?
      recipe.types << Type.create(name: params[:type][:name])
    end
    recipe.save

    if recipe.save
      flash[:message] = "#{recipe.name} recipe updated."
      redirect to "/recipes"
    else
      flash[:message] = recipe.errors.full_messages
      redirect to "/recipes/#{recipe.id}/edit"
    end

  end

  delete '/recipes/:id' do 
    recipe = Recipe.find(params[:id])
    if logged_in? && current_user.recipes.include?(recipe)
      recipe.delete
      flash[:message] = "Recipe deleted"
      redirect to "/recipes"
    elsif !logged_in?
      flash[:message] = "Please log in first"
      redirect to "/"
    else

      # THOUGHT: Perhaps I should dynamically change the style
      # of the edit/delete buttons and make them unclickable instead
      # of raising an error message.

      flash[:message] = "That's not your recipe. You can only delete your own recipes!"
    end
  end


end