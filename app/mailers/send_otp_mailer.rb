class SendOtpMailer < ApplicationMailer

	def send_otp(user, otp_code)
		 @user = user
   		 @otp_code = otp_code
   		 mail(to: @user.email, subject: 'Password Reset OTP')
   	end

end
