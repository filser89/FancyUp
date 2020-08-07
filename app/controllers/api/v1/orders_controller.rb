class Api::V1::OrdersController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:create]
  def list_user_orders
    @user = User.find(params[:user_id])
    @orders = @user.orders
  end

  def create
    p 'something'
    @rental = Rental.find(params[:rental_id])
    # @user = User.find(order_params)
    # debugger
    @order = Order.new(order_params)
    # @order.user = User.last
    @order.rental = @rental
    if @order.save
      render json: { status: "Order created" }
    else
      render_error
    end

  end

  private

  def order_params
    params.require(:order).permit(:user_id, :start_date, :end_date, :address)
    # startDate"=>"Aug 7, 2020", "endDate"=>"Aug 7, 2020", "address"=>"", "userId"=>101, "rental_id"=>"120", "order"=>{}
  end
  def render_error
    render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
  end
end
