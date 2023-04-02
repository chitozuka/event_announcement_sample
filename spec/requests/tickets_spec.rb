require 'rails_helper'

RSpec.describe 'Tickets', type: :request do
  describe 'POST #new' do
    context 'when the user is logged in' do
      before { get auth_callback_path(provider: 'github') }
      let(:event) { FactoryBot.create(:event) }
      let(:params) { FactoryBot.attributes_for(:ticket) }

      it 'create a new ticket' do
        expect do
          post event_tickets_path(event.id), params: { ticket: params }
        end.to change(Ticket, :count).by(1)
      end
    end
  end
end
