class Api::V1::RentalsController < Api::V1::BaseController
  before_action :set_rental, only: [ :show, :update, :destroy ]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  def index

    @rentals = Rental.all
  end

  def show; end

  def create
    @user = User.last
    @rental = Rental.new(rental_params)
    @rental.user = @user
    if @rental.save
      render :show
    else
      render_error
    end
  end

  def update
    if @rental.update(rental_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @rental.destroy
    render json: { status: :story_deleted }
  end

  def list_user_rentals
    @user = User.find(params[:user_id])
    @rentals = @user.rentals
  end

  private

  # def set_user
  #   @user = User.find(params[])
  # end

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:name, :category, :occasion, :size, :color, :image)
  end

  def render_error
    render json: { error: @rental.errors.full_messages }
  end
end
