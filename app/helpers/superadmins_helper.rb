# frozen_string_literal: true

module SuperadminsHelper
  def get_booking
    Booking.group_by_day(:from)
  end
end
