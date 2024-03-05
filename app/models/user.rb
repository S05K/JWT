class User < ApplicationRecord
	include Searchable
	# has_one :bus
	has_many :assign_subs
  	has_many :subcsriptions, through: :assign_subs
	has_secure_password
	after_destroy :send_delete_email
	# validates :email, presence: true,  uniqueness: true

	

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
