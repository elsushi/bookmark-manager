require 'sinatra/base'
require_relative 'server'

class BookmarkManager < Sinatra::Base
	set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    @links = Link.all

    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
