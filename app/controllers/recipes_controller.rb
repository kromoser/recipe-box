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
    current_user.recipes << @recipe
    redirect to "/recipes"
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
    if logged_in?
      @recipe = Recipe.find(params[:id])
      erb :'/recipes/edit'
    else
      flash[:message] = "Please log in first"
      redirect to "/"
    end
  end

  patch '/recipes/:id' do
    puts "Updated recipe"
  end


end