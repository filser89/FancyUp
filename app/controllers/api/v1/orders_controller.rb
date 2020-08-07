class Api::V1::OrdersController < Api::V1::BaseController
  def list_user_orders
    @user = User.find(params[:user_id])
    @orders = @user.orders
  end
end
