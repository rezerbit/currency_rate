# frozen_string_literal: true

RSpec.describe RateChannel, type: :channel do
  it 'subscribes to a stream' do
    subscribe
    expect(subscription).to be_confirmed
    expect(streams).to include('rate')
  end
end
