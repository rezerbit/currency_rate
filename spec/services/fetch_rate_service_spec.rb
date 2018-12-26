# frozen_string_literal: true

RSpec.describe FetchRateService do
  before { allow(Net::HTTP).to receive(:get) { currency_rates_xml } }

  describe '.call' do
    context 'when rates are absent in the database' do
      it 'fetches rate' do
        expect { described_class.call }.to change { Rate.last&.value }.to 66.78
      end
    end

    context 'when a last rate is forced' do
      let!(:forced_rate) { create :forced_rate }
      before { described_class.call }

      it 'saves a overridden fetched rate' do
        expect(Rate.last).to be_a FetchedRate
        expect(Rate.last.overridden).to eq true
        expect(Rate.last.value).to eq 66.78
      end
    end

    context 'when a last rate is equal an fetched rate' do
      let!(:last_rate) { create :fetched_rate, value: 66.78 }

      it 'not saves rate' do
        expect { described_class.call }.not_to change { Rate.count }.from 1
      end
    end
  end
end
