# frozen_string_literal: true

class CarType < ApplicationRecord
  has_many :cars

  validates :name, uniqueness: { scope: :fuel }

  FUEL = CarType.select(:fuel).distinct
  TYPE = CarType.select(:name).distinct

  def formatted_type
    "#{name.upcase}: #{fuel}"
  end
end
