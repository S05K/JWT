class AssignSubsController < ApplicationController
skip_before_action :authenticate_request, only: [:index]
	

	  def index
    	assign_subs = AssignSub.all
    	render json: assign_subs, each_serializer: AssignSubSerializer
  	  end

	def get_subs
		@subscription = @current_user.subcsriptions
		render json: {Sub: @subscription, user: @current_user}
	end

end
