class BooksController < ApplicationController
  include Wor::Paginate

  def book
    @book = Book.find(params[:id])
  end

  def show
    render json: book
  end

  def index
    render_paginated Book, each_serializer: BookSerializer
  end
end
