# frozen_string_literal: true

FactoryBot.define do
  factory :forced_rate do
    value { |n| 0.123456e2 + BigDecimal("0.000#{n}") }
    type { ForcedRate }
    expires_at { Time.current + 10.minutes }
  end
end
