require 'rails_helper'

RSpec.describe 'Retirements', type: :request do
  describe 'retirements #new' do
    context 'when user is logged in' do
      before { get auth_callback_path(provider: 'github') }

      it 'returns a status code of 200' do
        get new_retirement_path
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to top page' do
        get new_retirement_path
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'retirements #create' do
    context 'when user is logged in' do
      before { get auth_callback_path(provider: 'github') }

      it 'can delete the user' do
        expect do
          post retirements_path
        end.to change(User, :count).by(-1)
      end
    end

    context 'when user is not logged in' do
      it 'can not delete the user' do
        expect do
          post retirements_path
        end.to change(User, :count).by(0)

        expect(response).to redirect_to(root_path)
      end
    end
  end
end
