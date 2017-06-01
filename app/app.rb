ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
<<<<<<< HEAD
=======
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/link'
require_relative 'models/tag'
>>>>>>> 0d7ee7711e9e5bfc18e8288e22d5e93ba94b786f
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

  get '/links' do
    @links = Link.all
    p @links
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
<<<<<<< HEAD
    link = Link.new(url: params[:URL], title: params[:title])
=======
    link = Link.new(url: params[:URL],
                    title: params[:title])
>>>>>>> 0d7ee7711e9e5bfc18e8288e22d5e93ba94b786f
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
