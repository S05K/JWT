class AuthenticationController < ApplicationController
	skip_before_action :authenticate_request

	def login
		@user = User.find_by(email: params[:email])
		if @user&.authenticate(params[:password])
			token = jwt_encode(user_id: @user.id)
			render json: {token: token, user: @user}, status: :ok
		else
			render json: {error: 'unautherized'}, status: 404
		end
	end
end
