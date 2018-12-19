# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1'
gem 'redis', '~> 4.0.2'
gem 'sidekiq', '~> 5.2.1'
gem 'sidekiq-cron', '~> 1.0.4'
gem 'sidekiq-limit_fetch', '~> 3.4.0'
gem 'slim-rails', '~> 3.1.3'
gem 'validates_timeliness', '~> 5.0.0.alpha3'
gem 'webpacker', '~> 3.5.5'

group :development, :test do
  gem 'pry-byebug'
end

group :development do
  gem 'annotate'
  gem 'awesome_print'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'action-cable-testing'
  gem 'codecov', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.8'
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'simplecov', '~> 0.16.1'
end
