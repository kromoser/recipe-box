require "rack-flash"
require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions

  set :public_folder, 'public'
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash

  get '/' do
    if logged_in?
      @user = current_user
    end
    erb :index
  end

  helpers do 
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end

    def confirm_logged_in
      if !logged_in?
        flash[:message] = "You must be logged in to do that."
        redirect to "/"
      else
      end
    end

    # def users_ingredients(user)
    #   user.recipes.collect do |recipe| 
    #     recipe.ingredients
    #   end
    # end

    # def users_types(user)
    #   user.recipes.collect do |recipe|
    #     recipe.types
    #   end
    # end

    def recipe_validation(recipe, crud_function, id = nil)
      recipe.save
      if recipe.save
        if crud_function == "edit"
          flash[:message] = "#{recipe.name} recipe updated."
        elsif crud_function == "new"
          current_user.recipes << recipe
        end
        redirect to "/recipes"
      else
        flash[:message] = recipe.errors.full_messages.join(" & ")
        if id == nil  
          redirect to "/recipes/#{crud_function}"
        else
          redirect to "/recipes/#{id}/#{crud_function}"
        end
      end
    end

  end
end