require 'sinatra/base'
require_relative 'server'

class BookmarkManager < Sinatra::Base
	set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    @links = Link.all

    erb :index
  end

  post '/links' do 
  	url = params["url"]
  	title = params["title"]
  	tags = params["tags"].split(" ").map do |tag|
  		Tag.first_or_create(:text => tag)
  	end
  	Link.create(:url => url, :title => title, :tags => tags)
  	redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
