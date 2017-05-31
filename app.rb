require 'sinatra/base'
require './app/models/link'

class Bookmark < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  run! if app_file == $0
end