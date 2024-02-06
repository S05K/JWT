class DeleteUserMailer < ApplicationMailer

	 def delete_account(user)
		@user = user
    	mail(to: @user.email, subject: 'Account is deleted')
  	end
end
