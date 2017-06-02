ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

# The Bookmark class controls the Bookmark app using Sinatra
class Bookmark < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url:   params[:URL],
                    title: params[:title])
    params[:tags].split(' ').each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get 'users/new' do
    erb :'users/user'
  end

  run! if app_file == $PROGRAM_NAME
end
