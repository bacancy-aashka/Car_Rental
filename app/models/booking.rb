class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :customer
  belongs_to :driver
end
