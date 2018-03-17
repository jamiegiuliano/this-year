source 'http://rubygems.org'
# git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.3.3'
gem 'sinatra'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem 'rails-erd'
gem 'rack-flash3'
gem 'paperclip', '~> 5.2', '>= 5.2.1'
gem 'pg'

group :development do
  gem 'tux'
  gem 'shotgun'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
