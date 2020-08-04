class Api::V1::RentalsController < Api::V1::BaseController
  before_action :set_rental, only: [ :show, :update, :destroy ]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
    def index
    @rentals = Rental.all
    end
    def show

    end

  private

  def set_rental
      @rental = Rental.find(params[:id])
  end
end
