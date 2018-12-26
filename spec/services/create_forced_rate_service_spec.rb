# frozen_string_literal: true

RSpec.describe CreateForcedRateService do
  describe '.call' do
    subject { described_class.call(params) }

    context 'when params are invalid' do
      let(:params) { {} }

      it 'returns the instance of rate with errors' do
        expect(subject.errors).to be_present
      end
    end

    context 'when params are valid' do
      let(:params) { { value: 12.1234, expires_at: '2100-12-25T12:30:00.000Z' } }

      before do
        allow_any_instance_of(described_class).to receive(:delete_all_deforcing_jobs)
        allow(DeforceRateService).to receive(:delay_until) { DeforceRateService }
      end

      it 'saves the rate' do
        expect { subject }.to change { ForcedRate.last&.value }.to 12.1234
        expect(subject.errors).to be_blank
      end
    end
  end
end
