# frozen_string_literal: true

# Pulls a rate.
class PullRateWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'fifo', retry: 3

  def perform
    PullRateService.call
  end
end
