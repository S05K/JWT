class SubcsriptionsController < ApplicationController
	skip_before_action :authenticate_request, only:[:index]
	
	def index 
		@subs = Subcsription.all 
		render json: @subs, each_serializer: SubcsriptionSerializer
	end
end
