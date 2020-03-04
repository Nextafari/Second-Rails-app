source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Bcrypt is a password hashing gem that will help us secure the user's password on our database
gem 'bcrypt', '3.1.11'
# The faker gem is used to create fake users in the database automatically
gem 'faker', '1.6.3'
# This gem helps paginate the user index page
gem 'will_paginate', '3.1.5'
# This gem will incorporate bootstrap into the paginate gem file
gem 'bootstrap-will_paginate', '0.0.10'
# This intalls the Bootstrap gem that helps with styling the webpages
gem 'bootstrap-sass', '3.3.6'
# Use Puma as the app server
gem 'puma', '3.12.4'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '3.2.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# The following gems will help with image uploads in the sample app
gem 'carrierwave', '0.11.2' 
gem 'mini_magick', '4.9.4'
gem 'fog', '1.38.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.0.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.9.1'
gem 'bootsnap',   '1.4.4', require: true
# Installs JQuerry
gem 'jquery-rails', '4.3.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

#Hirb gem for a tabular view of the database
gem 'hirb', '~>0.7.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
# POSTGRESQL gem to enable heroku function well
gem 'pg', '0.20.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug',  '9.0.6', platform: :mri
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '1.3.13'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '3.28.0'
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest', '5.11.3'
  gem 'minitest-reporters', '1.3.8'
  gem 'guard', '2.15.0'
  gem 'guard-minitest', '2.4.6'
  gem 'selenium-webdriver', '3.142.3'
  gem 'webdrivers', '4.1.2'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '3.5.1'
  gem 'listen', '3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
