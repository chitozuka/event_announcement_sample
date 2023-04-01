FactoryBot.define do
  factory :ticket do
    association :user, factory: :user
    association :event, factory: :event
    comment { 'MyString' }
  end
end
