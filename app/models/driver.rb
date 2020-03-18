# frozen_string_literal: true

class Driver < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :licence_driver_image
  has_one_attached :driver_image
  has_many :driver_requests
end
