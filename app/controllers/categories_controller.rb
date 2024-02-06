class CategoriesController < ApplicationController
    skip_before_action :authenticate_request

    def index
      @categories = Category.all
      render json:{categories: @categories}
    end

    def create
      @category = Category.new(all_params)
      if @category.save
         # @category.image.attach(params[:image]) if params[:image].present?
        render json: {Category: @category}, status: 201
      else
        render json: {error: "Error"}, status: 422
      end
    end



    private
    def all_params
      params.permit(:name, :image)
    end
end
