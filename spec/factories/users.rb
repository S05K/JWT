FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.username(specifier: 5..10)  }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
  end
end
