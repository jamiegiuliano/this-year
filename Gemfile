source 'http://rubygems.org'
# git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.3.3'

gem 'sinatra'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem 'rack-flash3'
gem 'activerecord', :require => 'active_record'
gem 'pg'

group :development, :test do
  gem 'sqlite3'
  gem 'shotgun'
  gem 'tux'
  gem 'pry'
end

group :production do
  gem 'rails_12factor'
end
