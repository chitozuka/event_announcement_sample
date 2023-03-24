require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    Timecop.freeze(2023, 3, 23, 10, 0, 0)
    @event = FactoryBot.create(:event)
  end
  it "is valid with user" do
    expect(@event).to be_valid
  end
  it "is not valid with nil-name" do
    @event.name = nil
    expect(@event).not_to be_valid
  end
  it "is not valid with larger than 50 name length" do
    @event.name = 'a' * 51
    expect(@event).not_to be_valid
  end
  it "is not valid with nil-place" do
    @event.place = nil
    expect(@event).not_to be_valid
  end
  it "is not valid with larger than 100 place length" do
    @event.place = 'a' * 101
    expect(@event).not_to be_valid
  end
  it "is not valid with nil-content" do
    @event.content = nil
    expect(@event).not_to be_valid
  end
  it "is not valid with larger than 2000 content length" do
    @event.content = 'a' * 2001
    expect(@event).not_to be_valid
  end
  it "is not valid with nil-start_at" do
    @event.start_at = nil
    expect(@event).not_to be_valid
  end
  it "is not valid with nil-start_at" do
    @event.start_at = "2023-3-23 9:00"
    expect(@event).not_to be_valid
  end
  it "is not valid with nil-end_at" do
    @event.end_at = nil
    expect(@event).not_to be_valid
  end
  it "start_at < end_at is not valid" do
    @event.start_at = '2022-03-14 10:00'
    @event.end_at = '2022-03-14 9:00'
    expect(@event).not_to be_valid
  end
end
