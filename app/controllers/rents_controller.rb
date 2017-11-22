class RentsController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def rent_params
    params.permit(:user_id, :book_id, :from, :to)
  end

  def index
    @rents = if params[:user_id].present?
               Rent.includes(:user, :book).where(user_id: params[:user_id])
             else
               Rent.includes(:user, :book).where(book_id: params[:book_id])
             end
    render_paginated @rents, each_serializer: RentSerializer
  end

  def create
    @rents = Rent.create(rent_params)
    render json: @rents
  end
end
