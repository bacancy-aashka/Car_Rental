# frozen_string_literal: true

class TravelsController < ApplicationController
  before_action :set_params, only: [:create]
  before_action :set_id, only: [:show]
  before_action :authenticate_user!

  def index
    cust = Customer.select('id').find_by(user_id: current_user.id)
    @book = Booking.where('customer_id=?', cust.id)
  end

  def create
    @book = Booking.new
    @book.from = DateTime.strptime(params[:from_date] + ' ' + params[:from_time], '%d-%m-%Y %H:%M')
    @book.to = DateTime.strptime(params[:to_date] + ' ' + params[:to_time], '%d-%m-%Y %H:%M')
    @book.fuel = params[:fuel_type]
    @book.want_driver = params[:want_driver]
    @book.diff_city = params[:diff_loc]
    @book.car_id = params[:id]
    @cust = Customer.select('id').find_by(user_id: current_user.id)
    @book.customer_id = @cust.id
    if params[:want_driver] == 'true'
      @book.status = 'Pending'
    else
      @book.status = 'Booked'
      @car = Car.find(@book.id)
      @car.avail = false
      if @car.save!
        puts '----->Car Status Changed<-----'
      else
        puts '----->Car Status Change Fail<-----'
      end
    end

    if @book.save!

      @travel = Travel.new
      @travel.booking_id = @book.id
      @travel.address_id = params[:addr_pick]

      if params[:diff_loc] == 'true'
        @travel_drop = Travel.new
        @travel_drop.booking_id = @book.id
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
        redirect_to travel_path(@book.id)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @car = Car.find(@booking.car_id)
    @address = Travel.joins(:address).select('travels.*,addresses.*').where('travels.booking_id=?', params[:id])
  end

  private

  def set_id
    params.permit(:id)
  end

  def set_params
    if params[:diff_loc] == 'true'
      params.permit(:from_date, :from_time, :to_date, :to_time, :fuel_name, :fuel_type, :want_driver, :diff_loc, :car_id, :addr_pick, :addr_drop, :id)
    else
      params.permit(:from_date, :from_time, :to_date, :to_time, :fuel_name, :fuel_type, :want_driver, :diff_loc, :car_id, :addr_pick, :id)
    end
  end
end
