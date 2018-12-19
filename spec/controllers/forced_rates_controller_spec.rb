# frozen_string_literal: true

RSpec.describe ForcedRatesController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    subject { post :create }

    it 'returns http success' do
      is_expected.to redirect_to('/')
    end
  end
end
