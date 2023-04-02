FactoryBot.define do
  factory :ticket, class: Ticket do
    association :user, factory: :user
    association :event, factory: :event
    comment { 'MyString' }
  end
end
