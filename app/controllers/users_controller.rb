class UsersController < ApplicationController
	skip_before_action :authenticate_request, only: [:create]
	before_action :set_user, only: [:show, :destroy]

	def index
		 headers = request.headers['token'].split(' ').last
  		 decoded_token = jwt_decode(headers)
		if token_blacklisted?(headers) 
   		 	render json: { error: "Invalid token" }, status: :unauthorized
		elsif @current_user.present?
		 	 render json: @current_user, status: 200
		else 
			render json: {error: "not found"}, status: 404
		end
	end

	def show 
		render json: @user, status: :ok
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			render json: @user, status: :created
		else
			render json: {error: @user.errors.full_messages},
			status: :unprocessable_entity
		end
	end

	def update
		 headers = request.headers['token'].split(' ').last
  		 decoded_token = jwt_decode(headers)
		if token_blacklisted?(headers) 
   			 	render json: { error: "Invalid token" }, status: :unauthorized
		elsif @current_user.update(user_params)
			render json: @current_user
		else
			render json: {error: @user.errors.full_messages},
			status: :unprocessable_entity
		end
	end

	def destroy
		 headers = request.headers['token'].split(' ').last
  		 decoded_token = jwt_decode(headers)
		
		if token_blacklisted?(headers) 
   			 	render json: { error: "Invalid token" }, status: :unauthorized
		elsif @current_user.destroy
			render json: {message: "user is deleted"}
		else
			render json: {error: "not_found"}, status: 404
		end
	end


	 def delete_user
	    headers = request.headers['token'].split(' ').last
	    decoded_token = jwt_decode(headers)
	    if token_blacklisted?(headers) 
	      render json: { error: "Invalid token" }, status: :unauthorized
	    else
	      current_user_id = decoded_token['user_id']
	      @current_user.update(reason: params['reason'], value: true, deleted_at: Time.zone.now)
	      DeleteUserJob.set(wait: 14.days).perform_later(current_user_id)
	      render json: { message: "User deletion request received. Your account will be deleted after 14 days." }
	    end
  	end

  
	   def cancel_delete_account
	    headers = request.headers['token'].split(' ').last
	    decoded_token = jwt_decode(headers)
	    if token_blacklisted?(headers) 
	      render json: { error: "Invalid token" }, status: :unauthorized
	    else
	    	 current_user_id = decoded_token['user_id']
	     	 @current_user.update(value: false)
	       render json: { message: "Delete account process canceled successfully" }
	      end
	  	end


		private

	def user_params
		params.permit(:name, :username, :email, :password, :number)
	end

	def set_user
		@user = User.find_by(id: params[:id])
	end
end
