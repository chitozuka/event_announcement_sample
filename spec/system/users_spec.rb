require 'rails_helper'

RSpec.describe 'User', type: :system do
  context '未ログインの場合' do
    it 'ログインができること' do
      expect{
        visit root_path
        click_link 'GitHubでログイン'
        sleep 1
      }.to change(User, :count).by(1)
    end
  end
end
