# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/bill_mailer
class BillMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/bill_mailer/generate_bill
  def generate_bill
    BillMailer.generate_bill
  end
end
