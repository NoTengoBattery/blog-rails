FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    display { Faker::Internet.username(specifier: User::DISPLAY_MIN..User::DISPLAY_MAX) }
    password { Faker::Internet.password }
  end
end
