# frozen_string_literal: true

# Publishes currency exchange rates.
class RateChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rate'
  end
end
