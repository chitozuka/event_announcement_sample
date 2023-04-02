require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'validateion' do
    let(:user) { FactoryBot.create(:user) }
    let(:event) { FactoryBot.create(:event) }
    let(:ticket) { FactoryBot.build(:ticket, event: event, user: user) }

    context 'when all attributes are present' do
      it 'is valid' do
        expect(ticket).to be_valid
      end
    end

    context 'when user is nil' do
      it 'is valid' do
        ticket.user = nil
        expect(ticket).to be_valid
      end
    end

    context 'when comment is more than 50 characters' do
      it 'is invalid' do
        ticket.comment = 'a' * 31
        expect(ticket).to be_invalid
        expect(ticket.errors[:comment]).to include('は30文字以内で入力してください')
      end
    end
  end
end
