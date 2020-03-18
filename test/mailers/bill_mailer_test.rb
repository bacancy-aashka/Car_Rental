# frozen_string_literal: true

require 'test_helper'

class BillMailerTest < ActionMailer::TestCase
  test 'generate_bill' do
    mail = BillMailer.generate_bill
    assert_equal 'Generate bill', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
