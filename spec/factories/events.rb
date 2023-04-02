FactoryBot.define do
  factory :event do
    association :owner, factory: :owner
    sequence(:name) { |n| "event#{n}" }
    place { "Tokyo" }
    sequence(:start_at) { |n| DateTime.now + n }
    sequence(:end_at) { |n| DateTime.now + n + 1 }
    sequence(:content) { |n| "event content#{n}" }
  end
end
