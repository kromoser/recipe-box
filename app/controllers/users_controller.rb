class UsersController < ApplicationController

  get '/signup' do 
    erb :'/users/signup'
  end

  post '/signup' do 
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user.save
    if @user.save
      session[:id] = @user.id
      redirect to "/recipes"
    else
      flash[:message] = "There was an error."
      puts @user.errors
      redirect to "/signup"
    end
  end

  post '/login' do 
    if !logged_in?
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        redirect to "/recipes"
      
      else 
        flash[:message] = "Your username or password were incorrect. Try again."
        redirect to "/"
      end
    else 
      flash[:message] = "You're already logged in!"
      redirect to "/recipes"
    end
  end

  get '/logout' do 
    session.clear
    redirect to "/"
  end


end