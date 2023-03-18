require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryBot.create(:user) }
  it "is valid with provider, uid, name and image_url" do
    expect(@user).to be_valid
  end

  it "should raise error ActiveRecord::RecordNotUnique" do
    expect do
      FactoryBot.create(:user)
    end.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
