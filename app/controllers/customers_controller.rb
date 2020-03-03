class CustomersController < ApplicationController
  def index
    @booking = Booking.new
  end
end
