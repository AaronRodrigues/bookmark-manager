ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/link'
require './app/models/tag'
require './app/data_mapper_setup'

class Bookmark < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:URL], title: params[:title])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    redirect '/links'
  end

  run! if app_file == $0
end
