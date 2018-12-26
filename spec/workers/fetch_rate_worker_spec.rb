# frozen_string_literal: true

RSpec.describe FetchRateWorker do
  it { is_expected.to be_retryable 3 }
  it { is_expected.to be_processed_in :fifo }

  describe '#perform' do
    before { allow(Net::HTTP).to receive(:get) { currency_rates_xml } }

    it 'fetches a currency rate' do
      expect { described_class.new.perform }.to change { Rate.last&.value }.to 66.78
    end
  end

  describe '.perform_async' do
    it 'adds a job' do
      expect { described_class.perform_async }.to change(described_class.jobs, :size).by(1)
    end
  end
end
