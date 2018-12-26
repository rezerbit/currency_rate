# frozen_string_literal: true

RSpec.describe '/api/current_rate', type: :request do
  describe 'GET' do
    context 'when a rate exists' do
      let!(:rate) { create :fetched_rate }

      it 'returns current rate' do
        get '/api/current_rate'

        expect(response.status).to eq 200
        expect(json_response[:value]).to eq rate.value.to_s
      end
    end

    context 'when a rate not exists' do
      it 'returns current rate' do
        get '/api/current_rate'

        expect(response.status).to eq 404
        expect(json_response[:message]).to match "Couldn't find Rate"
      end
    end

    context 'when a last rate is forced' do
      let!(:fetched_rate) { create :fetched_rate, value: 11 }
      let!(:forced_rate) { create :forced_rate, value: 22 }

      it 'returns current rate' do
        get '/api/current_rate'

        expect(response.status).to eq 200
        expect(json_response[:value]).to eq forced_rate.value.to_s
      end
    end

    context 'when a last rate is overridden' do
      let!(:fetched_rate) { create :fetched_rate, value: 11 }
      let!(:forced_rate) { create :forced_rate, value: 22 }
      let!(:overriden_rate) { create :fetched_rate, overridden: true, value: 33 }

      it 'returns current rate' do
        get '/api/current_rate'

        expect(response.status).to eq 200
        expect(json_response[:value]).to eq forced_rate.value.to_s
      end
    end
  end
end
