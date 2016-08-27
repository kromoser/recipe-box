class UsersController < ApplicationController

  get '/signup' do 
    erb :'/users/signup'
  end

  post '/login' do 
    puts "you are logged in"
  end

end