class PostsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]
 
  def index
    # @posts = Post.paginate(page: params[:page], per_page: params[:per_page])
    render json: @posts
  end
end
