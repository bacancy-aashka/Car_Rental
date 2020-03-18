# frozen_string_literal: true

class AddCarFuelReferenceToCar < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :car_fuel, foreign_key: true
  end
end
