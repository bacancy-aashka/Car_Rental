# frozen_string_literal: true

class DriverRequestsController < ApplicationController
  def accept_request
    booking = Booking.find(params[:id])
    driver = Driver.select('id').find_by(user_id: current_user.id)
    booking.driver_id = driver.id
    booking.status = 'Booked'
    if booking.save!
      DriverMailer.driver_confirmation(booking).deliver
      flash[:success] = 'Booking Confirmed'
      redirect_to driver_approval_path
    else
      flash[:error] = 'Booking Failed To Confirm'
      redirect_to driver_approval_path
    end
  end

  def reject_request
    driver_request = DriverRequest.new
    driver_request.booking_id = params[:id]
    driver_request.driver_id = Driver.select('id').find_by(user_id: current_user.id).id
    driver_request.status = 'Disapproved'
    if driver_request.save!
      flash[:danger] = 'Request Rejected'
      redirect_to driver_approval_path
    else
      flash[:danger] = 'Error In Rejection'
      redirect_to driver_approval_path
    end
  end
end
