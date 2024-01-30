require 'rotp'

class ForgotPasswordsController < ApplicationController

	skip_before_action :authenticate_request

	def create
		@user = User.find_by(email: params[:email])
			if @user.present?
				 @otp_secret = ROTP::Base32.random_base32
   				 @otp = ROTP::TOTP.new(@otp_secret)
    			 @otp_code = @otp.now
   				 @user.update(otp_code: @otp_code)
   				 SendOtpMailer.send_otp(@user, @otp_code).deliver_now
				render json: {message: "Otp have been sent on your mail"}, status: 200
			else
				render json: {error: "user is not present"}, status: 404

			end
	end

	def verify_otp
		@user = User.find_by(email: params[:email])
		 if @user&.otp_code.present? && @user&.otp_code == params[:otp]
		 	@user.update(password: params[:password])
		 	render json: {message: "Success"}, status: 200
		 else
		 	render json: {error: "Otp is not valid"}, status: 400
		 end
	end

end
