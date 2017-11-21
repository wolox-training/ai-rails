class RentsController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def index
    if params[:user_id].present?
      @rents = Rent.includes(:user, :book).where(user_id: params[:user_id])
    else
      @rents = Rent.includes(:user, :book).where(book_id: params[:book_id])
    end
    render_paginated @rents, each_serializer: RentSerializer
  end

  def create
    @rents = Rent.create(rent_params)
    render json: @rents
  end
end
