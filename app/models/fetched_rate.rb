# frozen_string_literal: true

# == Schema Information
#
# Table name: rates
#
#  id         :bigint(8)        not null, primary key
#  value      :decimal(8, 4)    not null
#  type       :enum
#  overridden :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  expires_at :datetime
#
class FetchedRate < Rate
  validates :overridden, inclusion: [true, false]
end
