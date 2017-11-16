class BooksController < ApplicationController
  include Wor::Paginate
  before_action :book, only: [:show]

  def book
    @book = Book.find(params[:id])
  end

  def show
    render json: @book
  end

  def index
    render_paginated Book
  end
end
