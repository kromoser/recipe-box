class UsersController < ApplicationController

  get '/signup' do 
    erb :'/users/signup'
  end

  post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "Please fill in all fields"
      redirect to "/signup"
    else 
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:id] = @user.id
      #redirect to "/recipes"
      puts "you have signed up"
    end
  end

  post '/login' do 
    puts "you are logged in"
  end


end