# frozen_string_literal: true

class CreateCarTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :car_types do |t|
      t.string :name
      t.string :fuel

      t.timestamps
    end
  end
end
