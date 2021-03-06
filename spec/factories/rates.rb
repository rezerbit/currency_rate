# frozen_string_literal: true

FactoryBot.define do
  factory :rate do
    value { |n| 0.123456e2 + BigDecimal("0.000#{n}") }
    type { FetchedRate }
  end
end
