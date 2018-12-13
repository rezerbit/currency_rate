# frozen_string_literal: true

RSpec.describe '/api/current_rate', type: :request do
  describe 'GET' do
    context 'when a rate exists' do
      let!(:rate) { create :rate }

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
        expect(json_response[:message]).to eq("Couldn't find Rate")
      end
    end
  end
end
