# frozen_string_literal: true

class CarType < ApplicationRecord
  has_many :cars

  validates :name, uniqueness: true
end
