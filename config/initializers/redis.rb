# frozen_string_literal: true

return if Rails.env.test?

require 'redis'
$redis = Redis.new(YAML.load_file('config/redis.yml')[Rails.env])
