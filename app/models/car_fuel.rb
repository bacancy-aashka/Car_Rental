# frozen_string_literal: true

class CarFuel < ApplicationRecord
  has_many :cars

  validates :name, uniqueness: true
end
