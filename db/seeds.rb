# frozen_string_literal: true

FetchedRate.create(value: 12.1234)
FetchedRate.create(value: 67.1125, overridden: true)
ForcedRate.create(value: 60.37, expires_at: Time.current + 1.day)
