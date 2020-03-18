# frozen_string_literal: true

require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
  test 'booked_confirmation' do
    mail = BookingMailer.booked_confirmation
    assert_equal 'Booked confirmation', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'pending_request' do
    mail = BookingMailer.pending_request
    assert_equal 'Pending request', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'cancelled_request' do
    mail = BookingMailer.cancelled_request
    assert_equal 'Cancelled request', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'ongoing_request' do
    mail = BookingMailer.ongoing_request
    assert_equal 'Ongoing request', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'completed_request' do
    mail = BookingMailer.completed_request
    assert_equal 'Completed request', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
