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
      redirect "/events"
    else
      flash[:message] = "Event must have Title and Date."
      erb :'events/new'
    end
  end

  get '/events/:id' do
    @event = Event.find_by_id(params[:id])
    if logged_in? && current_user.events.include?(@event)
      erb :'events/show'
    else
      redirect "/users/#{current_user.slug}"
    end
  end

  get '/events/:id/edit' do
    @event = Event.find_by_id(params[:id])
    if logged_in? && current_user.events.include?(@event)
      erb :'events/edit'
    else
      redirect "/users/#{current_user.slug}"
    end
  end

  patch '/events/:id' do
    if !logged_in?
      redirect "/login"
    else
      @event = Event.find_by_id(params[:id])
      params["event"].each do |key, value|
          @event.update({key => value}) unless value.empty?
      end
      redirect "/events/#{@event.id}"
    end
  end

  delete '/events/:id/delete' do
    @event = Event.find_by_id(params[:id])

    if @event.user == current_user then @event.delete else redirect "/users/#{@event.user.slug}" end

    redirect "/events"
  end

end
