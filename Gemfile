source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.0.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1", ">= 6.1"
# Use Puma as the app server
gem "puma", "~> 5.3"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "6.0.0.beta.7"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5.2", ">= 5.2"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.11", ">= 2.11"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.2', '>= 4.2.5'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1', '>= 3.1.16'

# Extra gems required for this project
gem "aws-sdk-s3", require: false
gem "devise", "~> 4.7", ">= 4.7"
gem "devise-i18n", "~> 1.9", ">= 1.9"
gem "image_processing", "~> 1.12", ">= 1.12"
gem "kaminari", "~> 1.2", ">= 1.2"
gem "mina", "~> 1.2", ">= 1.2"
gem "mina-ng-puma", github: "NoTengoBattery/mina-ng-puma"
gem "rails-i18n", "~> 6.0"
gem "rest-client", "~> 2.1"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "~> 1.7", ">= 1.7", require: false

group :production do
  # Use postgresql for the production database
  gem "pg", "~> 1.2", ">= 1.2"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  # Add the SQLite3 database for development and test
  gem "sqlite3", "~> 1.4", ">= 1.4"
  # Add this to both development and test to take advantage of the generators
  gem "factory_bot_rails", "~> 6.1"
  gem "faker", "~> 2.16"
  gem "rspec-rails", "~> 4.0", ">= 4.0"
  # Helper to avoid N+1 and unused eager loads
  gem "bullet", "~> 6.1", ">= 6.1"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", "~> 4.1"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "listen", "~> 3.4", ">= 3.4"
  gem "rack-mini-profiler", "~> 2.3", ">= 2.3"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", "~> 2.1", ">= 2.1"
  # Rubocop linter gems for linting the source code during development
  gem "rubocop-faker", "~> 1.1"
  gem "rubocop-i18n", "~> 3.0"
  gem "rubocop-rails_config", "~> 1.3", ">= 1.3"
  gem "rubocop-rake", "~> 0.5"
  gem "rubocop-rspec", "~> 2.2"
  # This gem makes internationalization easier
  gem "i18n-tasks", "~> 0.9"
end

group :test do
  # Adds support for Capybara testing and the Selenium Web Driver
  gem "capybara", ">= 3.26"
  gem "database_cleaner", "~> 2.0", ">= 2.0"
  gem "selenium-webdriver", "~> 3.142", ">= 3.142"
  gem "webdrivers", "~> 4.6"
  # Gems to support testing better
  gem "rails-controller-testing", "~> 1.0", ">= 1.0"
  gem "rexml", "~> 3.2", ">= 3.2"
  gem "shoulda-matchers", "~> 4.5", ">= 4.5"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
