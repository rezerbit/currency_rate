# frozen_string_literal: true

# == Schema Information
#
# Table name: rates
#
#  id         :bigint(8)        not null, primary key
#  expires_at :datetime
#  forced     :boolean          default(FALSE), not null
#  value      :decimal(8, 4)    not null
#  created_at :datetime         not null
#
class Rate < ApplicationRecord
  validates :value, presence: true, numericality: true, format: { with: /\A\d{1,4}(.\d{0,4})?\z/ }
  scope :forced, -> { where(forced: true) }

  def forced?
    forced
  end
end
