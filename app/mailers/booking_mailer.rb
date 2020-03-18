# frozen_string_literal: true

class BookingMailer < ApplicationMailer
  default from: 'car.rental.aashka@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booked_confirmation.subject
  #
  def booked_confirmation(booking)
    @booking = booking

    mail to: 'car.rental.aashka@gmail.com', subject: 'Booking For Car Confirmed'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.pending_request.subject
  #
  def pending_request(booking)
    @booking = booking

    mail to: 'car.rental.aashka@gmail.com', subject: 'Request For Booking Done'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.cancelled_request.subject
  #
  def cancelled_request(booking)
    @booking = booking

    mail to: 'car.rental.aashka@gmail.com', subject: 'Cancellation Of Booking'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.ongoing_request.subject
  #
  def ongoing_request(booking)
    @booking = booking

    mail to: 'car.rental.aashka@gmail.com', subject: 'Trip Started'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.completed_request.subject
  #
  def completed_request(booking)
    @booking = booking

    mail to: 'car.rental.aashka@gmail.com', subject: 'Request For Booking Done'
  end
end
