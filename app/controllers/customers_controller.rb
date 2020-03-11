# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    @booking = Booking.new
  end
end
