class HelloController < ApplicationController

	skip_before_action :authenticate_request, only: [:index]

	
	def index
		arr=[1,2,3,"Sumit","John_Snow", 1.2,4.6, true]
		total=params[:type]
		# if total=="Integer"
		# 	integer_val=arr.select {|i| i.is_a?(Integer)}
		# 	render json: {integer_values: integer_val}
		# end
		case total
		when "String"
			string_val = arr.select {|i| i.is_a?(String)}
			render json: {string_values: string_val}
		when "Integer"
			integer_val=arr.select {|i| i.is_a?(Integer)}
			render json: {integer_values: integer_val}
		when "Float"
			float_val=arr.select {|i| i.is_a?(Float)}
			render json: {float_values: float_val}
		when "TrueClass"
			bool_val=arr.select {|i| i.is_a?(TrueClass)}
			render json: {bool_values: bool_val}
		else
			render json: {error: "Please give proper input"}
		end
		# arr.each do |i|
		# 	if i.is_a?(Integer)
		# 		@ans=i.is_a?(Integer)
		# 	end
		# end
		# render json: {array: @ans}
		# else
		# 	@ans=i.is_a?(String)
		# 	render json{ans: @ans}
		# end
	end
end


