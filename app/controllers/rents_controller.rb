class RentsController < ApiController
  include Wor::Paginate
  before_action :authenticate_user!

  def rent_params
    params.permit(:user_id, :book_id, :from, :to)
  end

  def rents(params)
    if params[:user_id].present?
      rent = Rent.includes(:user, :book).where(user_id: params[:user_id])
      authorize rent
      rent
    else
      Rent.includes(:user, :book).where(book_id: params[:book_id])
    end
  end

  def index
    @rents = rents(params)
    render_paginated @rents, each_serializer: RentSerializer
  end

  def create
    @rent = Rent.new(rent_params)
    authorize @rent
    begin
      @rent.save!
      EmailWorker.perform_async(@rent['id'])
      render json: @rent, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
      render json: { error: invalid.message }, status: :unprocessable_entity
    end
  end
end
