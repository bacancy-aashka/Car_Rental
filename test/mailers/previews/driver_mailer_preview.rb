# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/driver_mailer
class DriverMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/driver_mailer/driver_confirmation
  def driver_confirmation
    DriverMailer.driver_confirmation
  end
end
