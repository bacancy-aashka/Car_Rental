# frozen_string_literal: true

class Driver < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
end
