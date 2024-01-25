FactoryBot.define do
   
    factory :patient, class: Patient do 
      name { Faker::Name.name }

    end
   

end