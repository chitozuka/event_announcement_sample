FactoryBot.define do
  factory :user do
    provider {"github"}
    uid {"abc123"}
    name {"chitozuka"}
    image_url {"https://chitozuka.com/image.gif"}
  end

  factory :owner, class: User do
    provider {"github"}
    uid {"123456"}
    name {"eventOwner"}
    image_url {"https://eventOwner.com/image.gif"}
  end
end
