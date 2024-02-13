class CategoriesController < ApplicationController
    skip_before_action :authenticate_request


  # def index
  #   @categories = Category.all
  #   categories_with_image_urls = @categories.map do |category|
  #    {
  #     id: category.id,
  #     name: category.name,
  #     image_url: url_for(category.image) 
  #    }
  # end
  # render json: { categories: categories_with_image_urls }
  # end

  def index 
     @categories = Category.all
     render json: @categories, each_serializer: CategorySerializer 
  end


    def create
      byebug
      @category = Category.new(all_params)
      if @category.save
        render json: @category, each_serializer: CategorySerializer
      end
    end


    private
    def all_params
      params.permit(:name, :image)
    end
end
