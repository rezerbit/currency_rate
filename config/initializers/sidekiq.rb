# frozen_string_literal: true

sidekiq_config = { url: ENV['REDIS_URL'] }

Sidekiq.configure_server { |config| config.redis = sidekiq_config }
Sidekiq.configure_client { |config| config.redis = sidekiq_config }

return if Rails.env.test?

schedule_file = 'config/schedule.yml'

Sidekiq::Cron::Job.load_from_hash(YAML.load_file(schedule_file)) if File.exist?(schedule_file)
