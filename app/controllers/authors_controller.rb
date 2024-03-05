class AuthorsController < ApplicationController
  skip_before_action :authenticate_request, only: [:get_authors, :index]
 

  def get_authors
    @authors = Author.includes(:books).where(books: {activate: true})
    render json: {authors: @authors}
  end

  def index 
  # book=Book.all 
  Book.includes(:author).each do |i| 
    puts i.name, i.author.name
  end
  render json: {message: "check the console"}
  end


end
