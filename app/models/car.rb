# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :car_type
  belongs_to :car_fuel
  has_many :bookings

  FUEL = CarFuel.select(:name).distinct
  TYPE = CarType.select(:name).distinct

  validates :model, 
            uniqueness: true,
            format: {with: /\A[A-Z]{2}\s\d{2}\s[A-Z]{2}\s\d{4}\Z/,
            message: "Invalid Format Of Model..!!"},
            presence: true

  scope :searching, lambda { |s| 
  Car.joins(:car_type, :car_fuel).where('cars.name LIKE ? OR cars.model LIKE ? OR car_types.name LIKE ? OR car_fuels.name LIKE ? ', "%#{s}%", "%#{s}%", "%#{s}%", "%#{s}%") }

end
