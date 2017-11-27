class UsersController < ApiController
  include Wor::Paginate
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
