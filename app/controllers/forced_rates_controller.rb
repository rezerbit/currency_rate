# frozen_string_literal: true

# Creates a forced rate.
class ForcedRatesController < ApplicationController
  def new
    @rate = ForcedRate.last || Rate.new
  end

  # TODO
  def create
    redirect_to root_path, flash: { success: t('rate_has_been_forced') }
  end
end
