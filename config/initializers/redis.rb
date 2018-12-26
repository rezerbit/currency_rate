# frozen_string_literal: true

return if Rails.env.test?

require 'redis'

$redis = Redis.new(
  YAML.load(
    ERB.new(
      File.read(
        Rails.root.join('config', 'redis.yml')
      )
    ).result
  )[Rails.env]
)
