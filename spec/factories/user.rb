FactoryBot.define do
  factory :user do
    username { Faker::Name.name_with_middle }
    email    { Faker::Internet.email }
    password { "pass123456" }
  end

  factory :tweet do
    body { "I'm from Factory Bot" }
  end
end
