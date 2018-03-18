ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :console do
  Pry.start
end

namespace :db do
  task load_config: :setup_env do
    require_all 'app'
  end
end

task :setup_env do
  ENV['SINATRA_ENV'] ||= 'development'
end
