# frozen_string_literal: true

class RemoveColumnFuelFromCarType < ActiveRecord::Migration[6.0]
  def change
    remove_column :car_types, :fuel
  end
end
