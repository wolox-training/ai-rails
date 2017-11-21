class UsersController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def rent_params
    params.permit(:user_id, :book_id, :from, :to)
  end

  def show
    render json: book
  end

  def rents
    @rents = Rent.includes(:user, :book).where(user_id: params[:user_id])
    render_paginated @rents, each_serializer: RentSerializer
  end

  def create_rent
    @rents = Rent.create(rent_params)
    render json: @rents
  end
end
