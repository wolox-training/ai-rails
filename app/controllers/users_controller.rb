class UsersController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def rent_params
    params.permit(:user_id, :book_id, :from, :to)
  end

  def show
    render json: book
  end
end
