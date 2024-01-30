FactoryBot.define do
  factory :user, class: User do  
    name { Faker::Name.name }
    username { Faker::Internet.username(specifier: 5..10)  }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
  end


  factory :user1, class: User do  
    name { Faker::Name.name }
    username { Faker::Internet.username(specifier: 5..10)  }
     email { nil }
    password { Faker::Internet.password(min_length: 8) }
  end

  factory :user2, class: User do  
   name { Faker::Name.name }
    username { Faker::Internet.username(specifier: 5..10)  }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    otp_code { Faker::Number.number }
  end

end
