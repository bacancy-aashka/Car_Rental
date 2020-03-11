# frozen_string_literal: true

class AddDiffCityToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :diff_city, :boolean
  end
end
