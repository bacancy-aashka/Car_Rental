# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :customer
  belongs_to :driver, optional: true
  has_many :travels, dependent: :destroy
  has_many :driver_request, dependent: :destroy
  has_one :bill, dependent: :destroy

  def self.cron_job_booking_status_update
    bookings = Booking.all
    date_now = DateTime.now.strftime('%d-%m-%Y %H:%M:%S UTC')

    bookings.each do |booking|
      if booking.from < date_now && booking.status == 'Booked'
        if booking.want_driver == true
          driver = Driver.find(booking.driver_id)
          driver.avail = false
          driver.save!
        end
        car = Car.find(booking.car_id)
        car.avail = false
        car.save!
        booking.status = 'Ongoing'
        booking.save!
      elsif booking.from < date_now && booking.status == 'Pending'
        booking.status = 'Cancelled'
        booking.save!
      end
      next unless booking.to < date_now && booking.status == 'Ongoing'

      if booking.want_driver == true
        driver = Driver.find(booking.driver_id)
        driver.avail = true
        driver.save!
      end
      booking.status = 'Completed'
      booking.save!
    end
    puts 'Runner Cron Job For Status Update Successfully Done'
  end

  def customer_name(id)
    customer = Customer.find(id)
    user = User.find(customer.user_id)
    "#{user.fname}  #{user.lname}"
  end
end
