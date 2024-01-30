class User < ApplicationRecord
	
	has_secure_password
	validate :check_name
	 def check_name
        if email == ""
            errors.add(:email, "can't be an empty string")
         end
    end
end
