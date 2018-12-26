# frozen_string_literal: true

# Fetches a rate.
class FetchRateWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'fifo', retry: 3

  def perform
    FetchRateService.call
  end
end
