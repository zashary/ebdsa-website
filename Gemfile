source 'https://rubygems.org'
ruby File.read('.ruby-version')

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'annotate'
gem 'aws-sdk-s3', '~> 1'
gem 'devise'
gem 'activeadmin', '~> 2.2.0'
gem 'activeadmin_addons'
gem 'activeadmin_settings_cached'
gem 'activeadmin_quill_editor'
gem 'acts_as_list'
gem 'activeadmin_sortable_table'
gem 'autoprefixer-rails'
gem 'coffee-rails', '~> 5.0.0'
gem 'font-awesome-rails', '~> 4.7'
gem 'flipper'
gem 'flipper-active_record'
gem 'flipper-ui'
gem 'foreman'
gem 'icalendar'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'nationbuilder-rb', require: 'nationbuilder'
gem 'omniauth', '~> 1.6.1'
gem 'omniauth-auth0', '~> 2.0.0'
gem 'pg'
gem 'puma', '~> 3.12'
gem 'rack-slashenforce'
gem 'rails', '~> 6.0.6.1'
gem 'railties', '~> 6.0.6.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.1'
gem 'simple_calendar', '~> 2.0'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '~> 3.1.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'dotenv-rails'
  gem 'seed_dump'
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end