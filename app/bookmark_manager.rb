require 'sinatra/base'
require 'rack-flash'
require_relative 'server'
# require_relative 'helpers/application'


class BookmarkManager < Sinatra::Base
	set :session_secret, 'super secret'
	enable :sessions
  use Rack::Flash

  get '/' do
    @links = Link.all

    erb :index
  end

  get '/tags/:text' do 
  	tag = Tag.first(:text => params[:text])
  	@links = tag ? tag.links : []
  	erb :index
  end

  get '/users/new' do 
    @user = User.new
  	erb :"users/new"
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

  post '/users' do 
  	@user = User.new(:email => params[:email],
  										 :password => params[:password],
                       :password_confirmation => params[:password_confirmation])
    if @user.save
  	session[:user_id] = @user.id
  	redirect to('/')
    else
    flash.now[:errors] = @user.errors.full_messages
    erb :"users/new"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  helpers do 

    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  
end



  
end




