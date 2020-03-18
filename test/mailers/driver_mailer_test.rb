# frozen_string_literal: true

require 'test_helper'

class DriverMailerTest < ActionMailer::TestCase
  test 'driver_confirmation' do
    mail = DriverMailer.driver_confirmation
    assert_equal 'Driver confirmation', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
