source 'https://rubygems.org'

gem 'rails', '3.2.13'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'compass-rails'
  gem 'susy'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

# Setup testing framework
group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'timecop'
  gem 'thin'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
  gem 'unicorn'
end

gem 'capistrano'
gem 'whenever'
gem 'unified'
