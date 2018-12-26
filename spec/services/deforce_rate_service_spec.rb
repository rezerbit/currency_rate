# frozen_string_literal: true

RSpec.describe DeforceRateService do
  describe '.call' do
    subject { described_class.call }

    context 'when a fetched rate is absent' do
      it { is_expected.to eq nil }
    end

    context 'when a fetched rate exists' do
      let!(:fetched_rate) { create :fetched_rate, value: 11 }
      let!(:forced_rate) { create :forced_rate, value: 22 }

      it 'copies the fetched rate' do
        expect { subject }.to change { Rate.last.value }.to 11
      end
    end

    context 'when an overridden fetched rate exists' do
      let!(:fetched_rate) { create :fetched_rate, value: 11 }
      let!(:forced_rate) { create :forced_rate, value: 22 }
      let!(:overridden_rate) { create :fetched_rate, overridden: true, value: 33 }

      before { subject }

      it 'copies the fetched rate' do
        expect(Rate.count).to eq 4
        expect(Rate.last.value).to eq 33
        expect(Rate.last.overridden).to eq false
      end
    end
  end
end
