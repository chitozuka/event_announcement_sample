require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET #new' do
    before { get auth_callback_path(provider: 'github') }

    let(:valid_event_params) { FactoryBot.attributes_for(:event) }

    it 'return http success' do
      get new_event_path
      expect(response).to have_http_status(:success)
    end

    it 'create a new event' do
      expect do
        post events_path, params: { event: valid_event_params }
      end.to change(Event, :count).by(1)
    end

    it 'redirects to top page' do
      post events_path, params: { event: valid_event_params }
      expect(response).to redirect_to(event_path(Event.last))
    end
  end
end
