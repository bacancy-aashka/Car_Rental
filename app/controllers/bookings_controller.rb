# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_params, only: %i[show create_booking]
  before_action :set_params_booking, only: [:create_booking]

  def index
    # @cities = CS.cities(params[:state])
    # @cities_drop = CS.cities(params[:state_drop])
  end

  def create; end

  def search; end

  def show
    # byebug
    @address = Address.new
    @booking = set_params
    @cars = Car.joins(:car_type).select("cars.id as 'CarId',cars.name as 'CarName',cars.*,car_types.*").where('car_types.fuel=? AND cars.avail=? AND car_types.name=?', @booking[:fuel_type], true, @booking[:fuel_name])
    # byebug
  end

  def create_booking
    @address = Address.where('user_id=?', current_user)
    @booking = set_params
    # byebug
    @car = Car.find(params[:id])

    # if (params[:commit] == "Book")
    #   byebug
    # end
    # @book = Booking.new
  end

  private

  def set_params_booking
    params.permit(:id, :commit)
  end

  def set_params
    if params[:booking]
      params.require(:booking).permit(:from_date, :from_time, :to_date, :to_time, :fuel_name, :fuel_type, :want_driver, :diff_loc)
    else
      params.permit(:from_date, :from_time, :to_date, :to_time, :fuel_name, :fuel_type, :want_driver, :diff_loc)
    end
  end
end
