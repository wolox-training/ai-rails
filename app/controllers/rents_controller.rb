class RentsController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def rent_params
    params.permit(:user_id, :book_id, :from, :to)
  end

  def index
    # El codigo esta asi para que pase los tests. Hay que corregirlo.
    # TODO: si entran por user_id o por book_id es la misma url. Cómo identificarlo?
    @rents = if params[:user_id].present?
               authorize Rent.includes(:user, :book).where(user_id: params[:user_id])
               Rent.includes(:user, :book).where(user_id: params[:user_id])
             else
               Rent.includes(:user, :book).where(book_id: params[:book_id])
             end
    render_paginated @rents, each_serializer: RentSerializer
  end

  def create
    @rent = Rent.new(rent_params)
    authorize @rent
    @rent.save
    EmailWorker.perform_async(@rent['id'])
    render json: @rent
  end
end
