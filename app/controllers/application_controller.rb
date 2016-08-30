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

    def users_ingredients(user)
      user.recipes.collect do |recipe| 
        recipe.ingredients
      end
    end
  end
end