# frozen_string_literal: true

RSpec.describe ForcedRatesController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    before do
      allow_any_instance_of(CreateForcedRateService).to receive(:delete_all_deforcing_jobs)
      allow(DeforceRateService).to receive(:delay_until) { DeforceRateService }
    end

    subject { post :create, params: params }

    context 'when params are valid' do
      let(:params) { { forced_rate: { value: 12.1234, expires_at: '2100-12-26T09:00:00.000Z' } } }
      it { is_expected.to redirect_to('/') }
    end

    context 'when params are invalid' do
      let(:params) { { forced_rate: { value: 'INVALID', expires_at: '2100-12-26T09:00:00.000Z' } } }

      before { subject }

      it 'renders errors' do
        expect(response).to render_template 'new'
        expect(controller).to set_flash.now[:error]
      end
    end
  end
end
