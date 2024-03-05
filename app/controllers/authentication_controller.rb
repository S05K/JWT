require 'jwt'
class AuthenticationController < ApplicationController
	skip_before_action :authenticate_request

	include JsonWebToken
	extend ActiveSupport::Concern

	def login
		@user = User.find_by(email: params[:email])
		if @user&.authenticate(params[:password])
			token = jwt_encode(user_id: @user.id)
			render json: {token: token, user: @user}, status: :ok
		else
			render json: {error: 'unautherized'}, status: 404
		end
	end

	 	def destroy
	    	headers = request.headers['token'].split(' ').last
	   		session = User.find(jwt_decode(headers)["user_id"])
	   		payload = jwt_decode(headers)
			blacklist_token(headers)
			render json: {message: "Logout Successfully"}
        end

      

 	 	
end
