class Api::V1::RentalsController < Api::V1::BaseController
    def index
    @rentals = Rental.all
  end
end
