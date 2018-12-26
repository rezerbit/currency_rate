# frozen_string_literal: true

# Publishes a currency exchange rate.
class RateChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rate'
  end
end
