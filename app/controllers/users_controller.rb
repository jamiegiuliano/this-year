class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      "Logged In"
    else
      erb :'users/signup'
    end
  end





  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def username_available

    end
  end
end
