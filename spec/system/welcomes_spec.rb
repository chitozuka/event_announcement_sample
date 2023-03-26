require 'rails_helper'

RSpec.describe "Welcomes", type: :system do
  before do
    now_time = Time.local(2023, 1, 1, 12)
    Timecop.travel(now_time)
  end
  describe 'welcome page' do
    let!(:events) { FactoryBot.create_list(:event, 10, owner: FactoryBot.create(:user)) }

    context 'when not a logged-in user' do
      it 'event list is displayed' do
        visit root_path
        texts = events.map {|e|
          "#{e.name}.*\n#{e.start_at.strftime('%Y/%m/%d %H:%M')}.*#{e.end_at.strftime('%Y/%m/%d %H:%M')}"
        }.join(".*\n")
        expect(page.text).to match texts
      end
    end
  end
end
