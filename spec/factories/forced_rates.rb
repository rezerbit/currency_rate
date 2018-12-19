# frozen_string_literal: true

FactoryBot.define do
  factory :forced_rate do
    sequence(:value) { |n| 0.123456e2 + BigDecimal("0.000#{n}") }
    expires_at { Time.current }
  end
end
