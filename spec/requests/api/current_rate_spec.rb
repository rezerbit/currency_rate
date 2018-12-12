# frozen_string_literal: true

RSpec.describe '/api/current_rate', type: :request do
  describe 'GET' do
    it 'returns current rate' do
      get '/api/current_rate'

      expect(response.status).to eq 200
      expect(json_response[:value]).to eq(65.123)
    end
  end
end
