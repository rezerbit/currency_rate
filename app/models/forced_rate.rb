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
class ForcedRate < Rate
  validates :expires_at, timeliness: { type: :datetime, after: Time.current, allow_blank: false }
end
