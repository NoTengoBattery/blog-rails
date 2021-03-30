FactoryBot.define do
  factory :article do
    user_id { 1 }
    title { "MyString" }
    content { "MyText" }
    image_caption { "MyString" }
  end
end
