require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'page working!'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create({url: params['url']}, {title: params['title']})
    redirect '/bookmarks'
  end

  run! if app_file ==$0
end
