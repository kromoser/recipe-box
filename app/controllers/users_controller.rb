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
      redirect to "/recipes"
      puts "you have signed up"
    end
  end

  post '/login' do 
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect to "/recipes"
      
    else 
      flash[:message] = "Your username or password were incorrect. Try again."
      redirect to "/"
    end
  end

  get '/logout' do 
    session.clear
    redirect to "/"
  end


end