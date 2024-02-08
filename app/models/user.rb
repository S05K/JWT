class User < ApplicationRecord
	include Searchable
	has_secure_password
	after_destroy :send_delete_email
	

	validate :check_name
	 def check_name
        if email == ""
            errors.add(:email, "can't be an empty string")
        end
    end


     private
  	def send_delete_email
    	SendEmailsJob.perform_now(self)
  	end

end
