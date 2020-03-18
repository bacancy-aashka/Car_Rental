# frozen_string_literal: true

class DriversController < ApplicationController
  before_action :set_driver, only: %i[show edit]
  before_action :set_driver_update, only: %i[update]

  def index; end

  def approve
    @bookings = Booking.where('status=?', 'Pending').to_a
    driver = Driver.select('id').find_by(user_id: current_user.id)
    booked = Booking.where('driver_id=? AND status=?', driver.id, 'Booked')
    driver_rejects = DriverRequest.where('driver_id=?', driver.id)

    unless driver_rejects.empty?
      @bookings = @bookings.reject do |booking|
        driver_rejects.any? do |driver_reject|
          booking.id == driver_reject.booking_id
        end
      end
    end

    unless booked.empty?
      copy_booking = @bookings
      # byebug
      copy_booking = copy_booking.reject do |booking|
        booked.any? do |book|
          booking.from <= book.from && booking.to <= book.from
        end
      end

      copy_booking = copy_booking.reject do |booking|
        booked.any? do |book|
          booking.from >= book.to && booking.to >= book.to
        end
      end

      @bookings = @bookings.reject do |booking|
        copy_booking.any? do |book|
          booking.id == book.id
        end
      end
    end

    # byebug
  end

  def show_booking
    driver = Driver.select('id').find_by(user_id: current_user.id)
    @bookings = Booking.where('driver_id=?', driver.id)
  end

  def new; end

  def update
    if @driver.update(driver_params)
      flash[:success] = 'Driver Details Updated Succesfully'
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  private

  def set_driver
    @driver = Driver.find_by(user_id: params[:id])
  end

  def set_driver_update
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:licence, :experience, :salary, :licence_driver_image, :driver_image)
  end
end
