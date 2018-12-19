# frozen_string_literal: true

FactoryBot.define do
  factory :fetched_rate do
    sequence(:value) { |n| 0.123456e2 + BigDecimal("0.000#{n}") }
    overridden { false }
  end
end
