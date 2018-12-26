# frozen_string_literal: true

# Creates a forced rate.
class ForcedRatesController < ApplicationController
  def new
    @forced_rate = ForcedRate.last || ForcedRate.new
  end

  def create
    @forced_rate = CreateForcedRateService.call(forced_rate_params)

    if @forced_rate.errors.blank?
      redirect_to root_path, flash: { success: t('rate_has_been_forced') }
    else
      flash.now[:error] = t('forced_rate_not_saved')
      render :new
    end
  end

  private

  def forced_rate_params
    params.require(:forced_rate).permit(:value, :expires_at)
  end
end
