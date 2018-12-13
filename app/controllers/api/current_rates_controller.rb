# frozen_string_literal: true

module Api
  # Returns the current currency rate.
  class CurrentRatesController < Api::ApplicationController
    def show
      json_response(Rate.last!)
    end
  end
end
