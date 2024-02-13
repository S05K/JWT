class SubcategoriesController < ApplicationController
	skip_before_action :authenticate_request, only:[:create, :index]

  def create
  	@subcategory = Subcategory.new(all_att)
	if @subcategory.save
    	render json: @subcategory, each_serializer: SubcategorySerializer 
 	else
    	render json: { errors: @subcategory.errors.full_messages }, status: :unprocessable_entity
  	end
  end

  def index 
  	@subcategories = Subcategory.all
  	render json: @subcategories, each_serializer: SubcategorySerializer 
  end

private

def all_att
  params.require(:member).permit(:name, :category_id, images: [])
end

end
