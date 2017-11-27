class BooksController < ApiController
  include Wor::Paginate
  before_action :authenticate_user!

  def book
    @book = Book.find(params[:id])
  end

  def filter
    @book_search = Book
    %w[title author description].each do |attribute|
      if params[attribute].present?
        @book_search = @book_search.public_send(attribute, params[attribute])
      end
    end
  end

  def show
    render json: book
  end

  def index
    filter
    render_paginated @book_search, each_serializer: BookSerializer
  end

  def rents
    @rents = Rent.includes(:user, :book).where(book_id: params[:book_id])
    render_paginated @rents, each_serializer: RentSerializer
  end
end
