# frozen_string_literal: true

RSpec.describe PullRateService do
  describe '.call' do
    before { allow(Net::HTTP).to receive(:get) { currency_rates_xml } }

    context 'when rates are absent in the database' do
      it 'pull rate' do
        expect { described_class.call }.to change { Rate.last&.value }.to 66.78
      end
    end

    context 'when a last rate is forced' do
      let!(:forced_rate) { create :rate, forced: true }

      it 'not save rate' do
        expect { described_class.call }.not_to change { Rate.count }.from 1
      end
    end

    context 'when a last rate is equal an extracted rate' do
      let!(:last_rate) { create :rate, value: 66.78 }

      it 'not save rate' do
        expect { described_class.call }.not_to change { Rate.count }.from 1
      end
    end
  end
end
