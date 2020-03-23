# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_params, only: %i[show create_booking]
  before_action :set_params_booking, only: [:create_booking]

  def index
    # @cities = CS.cities(params[:state])
    # @cities_drop = CS.cities(params[:state_drop])
    # Booking.left_joins(:driver_request).select("bookings.status as 'Book_Status',bookings.driver_id as 'Book_Driver',bookings.id as 'Book_id', bookings.*, driver_requests.*").where("Book_Status=? AND driver_requests.status!=?",'Pending', 'Disapproved')
  end

  def create; end

  def search; end

  def show
    @booking = set_params
    @cars = Car.where('car_type_id=? AND car_fuel_id=?', @booking[:car_type_name], @booking[:car_fuel_name]).to_a
    from = DateTime.strptime(@booking[:from_date] + ' ' + @booking[:from_time], '%d-%m-%Y %H:%M')
    to = DateTime.strptime(@booking[:to_date] + ' ' + @booking[:to_time], '%d-%m-%Y %H:%M')
    car_reject = Car.joins(:bookings).where("(bookings.\"from\" between ? AND ?) OR (bookings.\"to\" between ? AND ?)", from, to, from, to)

    @cars = @cars.reject do |car|
      car_reject.any? do |rej|
        car.id == rej.id
      end
    end
    # byebug
  end

  def create_booking
    @address = Address.where('user_id=?', current_user)
    @booking = set_params
    @car = Car.find(params[:id])
  end

  def view_booking
    @bookings = Booking.paginate(page: params[:page], per_page: 10)
  end

  private

  def set_params_booking
    params.permit(:id, :commit)
  end

  def set_params
    if params[:booking]
      params.require(:booking).permit(:from_date, :from_time, :to_date, :to_time, :car_type_name, :car_fuel_name, :want_driver, :diff_loc)
    else
      params.permit(:from_date, :from_time, :to_date, :to_time, :car_type_name, :car_fuel_name, :want_driver, :diff_loc)
    end
  end
end
