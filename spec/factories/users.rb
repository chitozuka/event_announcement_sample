FactoryBot.define do
  factory :user do
    provider {"github"}
    uid {"abc123"}
    name {"chitozuka"}
    image_url {"https://chitozuka.com/image.gif"}
  end
end
