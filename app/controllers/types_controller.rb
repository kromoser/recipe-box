class TypesController < ApplicationController

  get '/categories' do 
    @categories = users_types(current_user).flatten
    erb :'/categories/index'
  end

end