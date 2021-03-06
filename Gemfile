source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# for api token
gem 'jwt', '~> 2.3.0'
# standardized way to build and use Service Objects (aka Commands) in Ruby
gem 'simple_command'

# reduce the html syntax
gem 'slim', '~> 4.0.1'
# colorful display
gem 'bootstrap', '~> 4.6.0'
# Bootstrap JavaScript depends on jQuery. add the jquery-rails gem
gem 'jquery-rails'
gem 'simple_form', '~> 5.1.0'
# use grape as api
gem 'grape', '~> 1.6.0'
gem 'grape-entity', '~> 0.10.0'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # table info
  gem 'annotate', '~> 3.1.1', require: false
  # static analysis
  gem 'brakeman', '~> 5.1.1', require: false
  # coding style
  gem 'rails-controller-testing'
  gem 'rubocop', '~> 1.22', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false

  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'rspec-rails', '~> 4.0.2'
end

group :test do
  gem 'database_cleaner', '~> 2.0'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # N+1 checker
  gem 'bullet', '~> 6.1.5'

  # pre-commit
  gem 'lefthook', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
