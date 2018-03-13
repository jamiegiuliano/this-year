class EventsController < ApplicationController

  get '/events' do
    if logged_in?
      erb :'events/index'
    else
      redirect to "/login"
    end
  end

  get '/events/new' do
    if logged_in? then erb :'events/new' else redirect "/login" end
  end

  post '/events/show' do
    if logged_in? && Event.create(params).valid?
      current_user.events.create(params)
    else
      erb :'events/new'
    end
    redirect "/events"
  end

end
