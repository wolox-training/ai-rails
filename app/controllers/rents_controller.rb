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
    @rent = Rent.create(rent_params)
    EmailWorker.perform_async(@rent['id'])
    render json: @rent
  end
end
