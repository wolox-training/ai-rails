class BooksController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def book
    @book = Book.find(params[:id])
  end

  def show
    render json: book
  end

  def index
    render_paginated Book, each_serializer: BookSerializer
  end

  def rents
    @rents = Rent.includes(:user, :book).where(book_id: params[:book_id])
    render_paginated @rents, each_serializer: RentSerializer
  end
end
