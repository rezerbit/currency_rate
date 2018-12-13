# frozen_string_literal: true

module Api
  # The base api class.
  class ApplicationController < ActionController::Base
    include Api::Response
    include Api::ExceptionHandlers
  end
end
