# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :customer
  belongs_to :driver, optional: true
  has_many :travels, dependent: :destroy

  def self.cron_job_booking_status_update
    bookings = Booking.all
    date_now = DateTime.now.strftime("%d-%m-%Y %H:%M:%S UTC")
    
    bookings.each do |booking|
        if booking.from < date_now && booking.status == "Booked"
            booking.status = "Ongoing"
            booking.save!
        elsif booking.from < date_now && booking.status == "Pending"
            booking.status = "Cancelled"
            booking.save!
        else;
        end
        if booking.to < date_now && booking.status== "Ongoing"
            booking.status = "Completed"
            booking.save!
        end
    end
    puts "Runner Cron Job For Status Update Successfully Done"
end
end
