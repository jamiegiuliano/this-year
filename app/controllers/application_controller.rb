require './config/environment'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
      set :session_secret, "secret"
  end

  get "/" do
    if logged_in? then redirect "/users/#{current_user.slug}" else erb :index end
  end

  get '/about' do
    erb :about
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

end
