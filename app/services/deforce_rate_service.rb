# frozen_string_literal: true

# Copies a last fetched rate.
class DeforceRateService
  def self.call
    rate = FetchedRate.last.dup
    return if rate.nil?

    rate.overridden = false
    rate.save!
  end
end
