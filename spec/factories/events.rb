FactoryBot.define do
  factory :event do
    association :owner, factory: :user
    name {"event1"}
    place {"Tokyo"}
    start_at {"2023/04/20 11:00"}
    end_at {"2023/04/20 12:00"}
    content {"event content"}
  end
end
