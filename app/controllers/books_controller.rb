class BooksController < ApiController
  include Wor::Paginate
  before_action :authenticate_user!, except: [:book_info]

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

  def book_info
    ol_service = OpenLibraryService.new
    render json: ol_service.book_info(params[:isbn]) if params[:isbn].present?
  end
end
