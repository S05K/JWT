FactoryBot.define do
   
    factory :appointment, class: Appointment do 
      physician_id { Faker::Number.between(from: 1, to: 999)}
      patient_id  { Faker::Number.between(from: 1, to: 999)}
    end
   

end