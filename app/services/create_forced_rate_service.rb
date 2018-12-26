# frozen_string_literal: true

# Creates a forced rate.
#
# Returns an instance with errors if a validation has been failed.
# Example
#   rate = CreateForcedRateService(params)
#   rate.errors.blank?
#   => false
#
# Returns instance of Rate.
class CreateForcedRateService
  DEFORCING_JOB_CLASS = 'DeforceRateService'

  def self.call(params)
    new(params).call
  end

  def initialize(params)
    @rate = ForcedRate.new(params)
  end

  def call
    ActiveRecord::Base.transaction do
      @rate.save!
      delete_all_deforcing_jobs
      create_deforcing_job
    end

    @rate
  rescue ActiveRecord::RecordInvalid
    @rate
  end

  private

  def delete_all_deforcing_jobs
    delete_from(Sidekiq::ScheduledSet.new)
    delete_from(Sidekiq::Queue.new)
    delete_from(Sidekiq::RetrySet.new)
  end

  def delete_from(set)
    set.each do |job|
      job.delete if job.args.first.include?(DEFORCING_JOB_CLASS)
    end
  end

  def create_deforcing_job
    DeforceRateService.delay_until(@rate.expires_at, queue: 'fifo').call
  end
end
