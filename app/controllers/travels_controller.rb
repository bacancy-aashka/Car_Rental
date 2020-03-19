# frozen_string_literal: true

class TravelsController < ApplicationController
  before_action :set_params, only: [:create]
  before_action :set_id, only: [:show]
  before_action :authenticate_user!

  def index
    @bookings = Booking.where('customer_id=?', current_user.customer.id).order(id: :desc).paginate(page: params[:page], per_page: 8)
  end

  def create
    # byebug
    @booking = Booking.new
    @booking.from = DateTime.strptime(params[:from_date] + ' ' + params[:from_time], '%d-%m-%Y %H:%M')
    @booking.to = DateTime.strptime(params[:to_date] + ' ' + params[:to_time], '%d-%m-%Y %H:%M')
    fuel = CarFuel.find(params[:car_fuel_name])
    @booking.fuel = fuel.name
    @booking.want_driver = params[:want_driver]
    @booking.diff_city = params[:diff_loc]
    @booking.car_id = params[:id]
    cust = Customer.find_by(user_id: current_user.id)
    @booking.customer_id = cust.id
    @booking.status = if params[:want_driver] == 'true'
                        'Pending'
                      else
                        'Booked'
                      end
    car = Car.find(params[:id])
    if @booking.save
      if @booking.status == 'Booked'
        BookingMailer.booked_confirmation(@booking).deliver
      elsif @booking.status == 'Pending'
        BookingMailer.pending_request(@booking).deliver
      end

      @travel = Travel.new
      @travel.booking_id = @booking.id
      @travel.address_id = params[:addr_pick]

      if params[:diff_loc] == 'true'
        @travel_drop = Travel.new
        @travel_drop.booking_id = @booking.id
        @travel_drop.address_id = params[:addr_drop]
        @travel_drop.addr_type = 'Drop'
        @travel.addr_type = 'Pick Up'

        if @travel_drop.save!
          puts '----->Stored<-----'
        else
          puts '----->Error<------'
        end

      else
        @travel.addr_type = 'Both'
      end

      if @travel.save!
        flash[:success] = 'Successfully Booked'
        redirect_to travel_path(@booking.id)
      else
        redirect_to root_path
      end
    else
      flash[:danger] = "Booking Failed Retry"
      render 'customers/index'
    end
  end

  def show
    @booking = Booking.includes(:car).find(params[:id])
    @address = Travel.joins(:address).select('travels.*,addresses.*').where('travels.booking_id=?', params[:id])
    unless @booking.driver_id.nil?
      @driver = Driver.find(@booking.driver_id)
      @driver_details = User.find(@driver.user_id)
    end
    if @booking.status == 'Completed'
      @bill = Bill.find_by(booking_id: @booking.id)
    end
  end

  def error_licence
    redirect_to root_path
  end

  private

  def set_id
    params.permit(:id)
  end

  def set_params
    if params[:diff_loc] == 'true'
      params.permit(:from_date, :from_time, :to_date, :to_time, :car_fuel_name, :car_type_name, :want_driver, :diff_loc, :car_id, :addr_pick, :addr_drop, :id)
    else
      params.permit(:from_date, :from_time, :to_date, :to_time, :car_fuel_name, :car_type_name, :want_driver, :diff_loc, :car_id, :addr_pick, :id)
    end
  end
end
