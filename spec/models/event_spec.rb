require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    let(:event) { FactoryBot.build(:event) }

    context 'when all attributes are present' do
      it 'is valid' do
        expect(event).to be_valid
      end
    end

    context 'when name is null' do
      it 'is invalid' do
        event.name = nil
        expect(event).to be_invalid
        expect(event.errors[:name]).to include('を入力してください')
      end
    end

    context 'when name is more than 50 characters' do
      it 'is invalid' do
        event.name = 'a' * 51
        expect(event).to be_invalid
        expect(event.errors[:name]).to include('は50文字以内で入力してください')
      end
    end

    context 'when place is null' do
      it 'is invalid' do
        event.place = nil
        expect(event).to be_invalid
        expect(event.errors[:place]).to include('を入力してください')
      end
    end

    context 'when place is more than 100 characters' do
      it 'is invalid' do
        event.place = 'a' * 101
        expect(event).to be_invalid
        expect(event.errors[:place]).to include('は100文字以内で入力してください')
      end
    end

    context 'when content is null' do
      it 'is invalid' do
        event.content = nil
        expect(event).to be_invalid
        expect(event.errors[:content]).to include('を入力してください')
      end
    end

    context 'when content is more than 2000 characters' do
      it 'is invalid' do
        event.content = 'a' * 2001
        expect(event).to be_invalid
        expect(event.errors.full_messages).to include('内容は2000文字以内で入力してください')
      end
    end

    context 'when content is null' do
      it 'is invalid' do
        event.content = nil
        expect(event).to be_invalid
        expect(event.errors[:content]).to include('を入力してください')
      end
    end

    context 'when content is more than 2000 characters' do
      it 'is invalid' do
        event.content = 'a' * 2001
        expect(event).to be_invalid
        expect(event.errors.full_messages).to include('内容は2000文字以内で入力してください')
      end
    end

    context 'when start_at is null' do
      it 'is invalid' do
        event.start_at = nil
        expect(event).to be_invalid
        expect(event.errors[:start_at]).to include('を入力してください')
      end
    end

    context 'when start_at is after end_at' do
      it 'is invalid' do
        event.start_at = '2022-03-14 10:00'
        event.end_at = '2022-03-14 9:00'
        expect(event).to be_invalid
        expect(event.errors[:start_at]).to include('は終了時間よりも前に設定してください')
      end
    end

    context 'end_at is null' do
      it 'is invalid' do
        event.end_at = nil
        expect(event).to be_invalid
        expect(event.errors[:end_at]).to include('を入力してください')
      end
    end
  end
end
