class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      "Logged In"
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if User.create(params).valid?
      @user = User.create(params)
      session[:user_id] = @user.id
    else
      flash[:message] = @user.errors.full_messages.join(', ')
      redirect "/signup"
    end
    redirect "/users/#{@user.username.slug}"
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
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
