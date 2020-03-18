# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :car_type
  belongs_to :car_fuel
  has_many :bookings

  FUEL = CarFuel.select(:name).distinct
  TYPE = CarType.select(:name).distinct

  # validates :model, uniqueness: true
end
