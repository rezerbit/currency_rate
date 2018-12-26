# frozen_string_literal: true

FactoryBot.define do
  factory :fetched_rate do
    value { |n| 0.123456e2 + BigDecimal("0.000#{n}") }
    type { FetchedRate }
    overridden { false }
  end
end
