# frozen_string_literal: true

class BillMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bill_mailer.generate_bill.subject
  #
  def generate_bill(bill, booking, user)
    @bill = bill
    @user = user
    @booking = booking
    attachments['bill.pdf'] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'Invoice', template: 'bills/invoice.pdf.erb')
    )

    mail to: 'car.rental.aashka@gmail.com', subject: 'Bill Generated'
  end
end
