# frozen_string_literal: true

class BillsController < ApplicationController
  def new
    @booking = Booking.find(params[:id])
    @bill = Bill.new
  end

  def index
    bills = Bill.all
    if current_user.has_role? :driver
      driver = Driver.find_by(user_id: current_user.id)
      @bookings = Booking.where('status=? AND driver_id=?', 'Completed', driver.id)
    else
      @bookings = Booking.where('status=? AND want_driver=?', 'Completed', false)
    end

    @bookings = @bookings.reject do |booking|
      bills.any? do |bill|
        booking.id == bill.booking_id
      end
    end
  end

  def create
    @bill = Bill.new(bill_params)
    booking = Booking.find(@bill.booking_id)
    car = Car.find(booking.car_id)
    number_of_days = (booking.to.to_date - booking.from.to_date).to_i + 1
    @bill.actual_km = if @bill.total_kms < number_of_days * car.min_kms
                        number_of_days * car.min_kms
                      else
                        @bill.total_kms
                      end
    @bill.amount = @bill.actual_km * car.cost_per_km
    @bill.tax = @bill.amount * 0.05
    @bill.total = @bill.amount + @bill.tax + @bill.toll_tax
    if @bill.save!
      booking = Booking.find(@bill.booking_id)
      customer = Customer.find(booking.customer_id)
      user = User.find(customer.user_id)
      BillMailer.generate_bill(@bill, booking, user).deliver

      flash[:success] = 'Bill Generated Successfully'

      redirect_to bills_path
    else
      flash[:danger] = 'Bill Failed To Generate'
      redirect_to bills_path
    end
    # byebug
  end

  def bill_pdf
    @bill = Bill.find(params[:id])
    @booking = Booking.find(@bill.booking_id)
    customer = Customer.find(@booking.customer_id)
    @user = User.find(customer.user_id)
    respond_to do |format|
      format.pdf { render template: 'bills/invoice', pdf: 'Invoice' }
    end
  end

  private

  def bill_params
    if current_user.has_role? :driver
      params.require(:bill).permit(:total_kms, :toll_tax, :driver_amt, :booking_id)
    else
      params.require(:bill).permit(:total_kms, :toll_tax, :booking_id)
    end
  end
end
