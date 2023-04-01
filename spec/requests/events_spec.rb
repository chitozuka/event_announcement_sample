require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET #new' do
    context 'when the user is logged in' do
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

  describe 'Edit' do
    let(:user) { User.last }
    let(:event) { FactoryBot.create(:event, owner: user) }
    let(:update_event_params) { FactoryBot.attributes_for(:event, place: 'Kanagawa') }

    context 'when the user is logged in' do
      before { get auth_callback_path(provider: 'github') }

      it 'updates the event' do
        get event_path(event.id)
        put event_path(event.id), params: { event: update_event_params }
        expect(response).to redirect_to(event_path(event.id))
        expect(event.reload.place).to eq 'Kanagawa'
      end
    end
  end
end
