# frozen_string_literal: true

require 'pry-byebug'
require 'factory_bot'
require 'database_cleaner'
require 'sidekiq/testing'
require 'faker'

require 'rails_helper'

require 'simplecov'
SimpleCov.start('rails') do
  add_filter 'spec/'
  add_filter 'bin/'

  minimum_coverage 60
end

if ENV['CODECOV_TOKEN']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'action_cable/testing/rspec'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '../tmp/examples.txt'
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  unless ENV['CODECOV_TOKEN']
    config.filter_run_including focus: true
    config.run_all_when_everything_filtered = true
  end

  config.include Helpers
end

RSpec::Sidekiq.configure do |config|
  config.warn_when_jobs_not_processed_by_sidekiq = false
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
