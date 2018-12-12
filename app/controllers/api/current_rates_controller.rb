# frozen_string_literal: true

module Api
  # Returns the current currency rate.
  class CurrentRatesController < Api::ApplicationController
    def show
      json_response(value: 65.123) # TODO
    end
  end
end
