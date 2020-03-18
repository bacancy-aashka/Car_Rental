# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/booked_confirmation
  def booked_confirmation
    BookingMailer.booked_confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/pending_request
  def pending_request
    BookingMailer.pending_request
  end

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/cancelled_request
  def cancelled_request
    BookingMailer.cancelled_request
  end

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/ongoing_request
  def ongoing_request
    BookingMailer.ongoing_request
  end

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/completed_request
  def completed_request
    BookingMailer.completed_request
  end
end
