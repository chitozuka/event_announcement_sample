require 'rails_helper'

RSpec.describe 'User', type: :system do
  subject do
    visit root_path
    click_link 'GitHubでログイン'
  end

  describe 'root_path' do
    context '未ログインの場合' do
      it 'ログインができること' do
        expect { subject }.to change(User, :count).by(1)
        expect(page).to have_content 'ログインしました'
        expect(page).to have_content 'ログアウト'
      end
    end

    context 'ログイン済みの場合' do
      it 'ログアウトができること' do
        subject
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
        expect(page).to have_content 'GitHubでログイン'
      end
    end
  end
end
