# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :licence_customer_image
end
