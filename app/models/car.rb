# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :car_type
  has_many :bookings

  validates :model, uniqueness: true
end
