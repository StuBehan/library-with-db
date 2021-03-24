require 'sinatra/base'
require './lib/library_manager'

class Library < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add_book' do
    LibraryManager.add(params[:title], params[:author], params[:isbn])
    redirect '/'
  end

  run! if app_file == $0
end
