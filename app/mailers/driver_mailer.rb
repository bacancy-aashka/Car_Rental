# frozen_string_literal: true

class DriverMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.driver_mailer.driver_confirmation.subject
  #
  def driver_confirmation(booking)
    @booking = booking
    mail to: 'car.rental.aashka@gmail.com', subject: 'Driver Booking Confirmation'
  end
end
