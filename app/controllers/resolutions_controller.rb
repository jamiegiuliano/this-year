class ResolutionsController < ApplicationController
  get '/resolutions' do
    if logged_in?
      erb :'resolutions/index'
    else
      redirect to "/login"
    end
  end

  get '/resolutions/new' do
    if logged_in? then erb :'resolutions/new' else redirect "/login" end
  end

  post '/resolutions/show' do
    if logged_in?
      if params["resolution"]["name"] && params["res_id"]
        current_user.resolutions.create(params["resolution"])

        params[:res_id].each do |id|
          res = Resolution.find_by_id(id)
          current_user.resolutions << res
          current_user.save
        end
      elsif params["resolution"]["name"]
        current_user.resolutions.create(params["resolution"])
      end
    else
      flash[:message] = "Resolutions must have Name."
      erb :'resolutions/new'
    end

    redirect "/resolutions"
  end

  get '/resolutions/:id' do
    @resolution = Resolution.find_by_id(params[:id])
    if logged_in? && current_user.resolutions.include?(@resolution)
      erb :'resolutions/show'
    else
      redirect "/users/#{current_user.slug}"
    end
  end

  get '/resolutions/:id/edit' do
    @resolution = Resolution.find_by_id(params[:id])
    if logged_in? && current_user.resolutions.include?(@resolution)
      erb :'resolutions/edit'
    else
      redirect "/users/#{current_user.slug}"
    end
  end

  patch '/resolutions/:id' do
    if !logged_in?
      redirect "/login"
    else
      @resolution = Resolution.find_by_id(params[:id])
      params["resolution"].each do |key, value|
          @resolution.update({key => value}) unless value.empty?
      end
      redirect "/resolutions/#{@resolution.id}"
    end
  end

  delete '/resolutions/:id/delete' do
    @resolution = Resolution.find_by_id(params[:id])
    
    if @resolution.users.include?(current_user) then current_user.resolutions.delete(@resolution) else redirect "/users/#{@resolution.user.slug}" end

    redirect "/resolutions"
  end

end
