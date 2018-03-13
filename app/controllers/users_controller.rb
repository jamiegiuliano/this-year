class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      "Logged In"
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.new(params)
		if @user.save
			session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      flash[:message] = @user.errors.full_messages.join(', ')
      erb :'users/signup'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/login' do
    @user = User.find_by_id(session[:user_id])

    if logged_in?
      redirect "/users/#{@user.slug}"
    end
    erb :'users/login'
  end

  post '/login' do
    if @user = User.find_by(:username => params[:username]).try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      flash[:message] = "Username or Password incorrect"
      erb :'users/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect to "/"
    end
  end
end
