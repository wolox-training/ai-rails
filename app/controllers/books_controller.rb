class BooksController < ApplicationController
  include Wor::Paginate
  before_action :get_book, only: [:show]

  def get_book
    @book = Book.find(params[:id])
    render json: @book
  end

  def show
  end

  def index
    render_paginated Book
  end
end
