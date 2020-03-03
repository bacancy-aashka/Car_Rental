class Car < ApplicationRecord
  belongs_to :car_type
  has_many :bookings
end
