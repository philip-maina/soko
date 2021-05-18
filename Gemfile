source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'


# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# scanf as of 2.7.0 is no longer bundled with Ruby. 
# It is now distributed alone by Rubygems.
gem 'scanf', '~> 1.0'



# Rails interface to the {PostgreSQL RDBMS}
gem 'pg', '~> 1.2', '>= 1.2.3'
# Integrate PostgreSQL's enum data type into ActiveRecord's schema and migrations.
gem 'activerecord-postgres_enum', '~> 1.6'
# Adds methods to ActiveRecord::Migration to create and manage database functions and triggers in Rails. 
# This means you don't have to switch the schema format to SQL as you would have had to do.
gem 'fx', '~> 0.6.2'
# Add support for PostgreSQL's SEQUENCE on ActiveRecord migrations
gem 'ar-sequence', '~> 0.1.2'
# For full text searching by Postgres
gem 'pg_search', '~> 2.3', '>= 2.3.5'


# Use redis adapter for in-memory key–value database, caching and pub/sub messaging
gem 'redis', '~> 4.2', '>= 4.2.5'
# Cross platform GUI tool for redis
gem 'redis-browser', '~> 0.5.1'


# For pricing and currency fields
gem 'money-rails', '~> 1.14'
# Efficiently inserting large batches of data with ActiveRecord
gem 'activerecord-import', '~> 1.0', '>= 1.0.8'


# For background job processing.
gem "sidekiq"
# Sinatra powers the web ui for sidekiq
gem "sinatra", require: false
# For Sidekiq Statistics
gem "sidekiq-statistic"


# Use Active Storage variant (does resizing of images)
gem 'image_processing', '~> 1.2'
# Validation for active storage isn't yet integrated in the official release of Rails 6
gem 'active_storage_validations', '~> 0.9.2'
# AWS/Digital Ocean Ruby gem for Amazon Simple Storage Service (Amazon S3) or DO Spaces.
gem 'aws-sdk-s3', '~> 1.93'


# For enabling Haml as the templating engine
gem 'haml-rails', '~> 2.0', '>= 2.0.1'
# For Page-specific javascript
gem 'paloma', '~> 6.0'
# For font awesome icons
gem "font-awesome-rails"


# Great Ruby debugging companion: pretty print Ruby objects to visualize their structure
gem 'awesome_print', '~> 1.9', '>= 1.9.2'
# Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
gem 'annotate', '~> 3.1', '>= 3.1.1'
# Add RuboCop code style checking
gem 'rubocop-rails_config', '~> 1.3', '>= 1.3.4'
# Adds methods to set text color, background color and, text effects on ruby console and 
# command line output, using ANSI escape sequences.
gem 'colorize', '~> 0.8.1'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Fixtures replacement with a straightforward definition syntax.
  # Including factory_bot_rails in the development group of your Gemfile will 
  # allow Rails to generate factories instead of fixtures.
  gem 'factory_bot_rails', '~> 6.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'


  # Allows mocking and stubbing of methods.
  gem 'mocha', '~> 1.12'
  # Easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 2.17'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
