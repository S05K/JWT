FactoryBot.define do
   
    factory :physician, class: Physician do 
      name { Faker::Name.name }

    end
   

end