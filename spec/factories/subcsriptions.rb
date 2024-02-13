FactoryBot.define do
  factory :subcsription do
    name { Faker::Name.name }
    price { 500 }
  end
end
