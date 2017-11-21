class BooksController < ApplicationController
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
end
