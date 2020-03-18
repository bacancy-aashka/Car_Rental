# frozen_string_literal: true

class CreateCarFuels < ActiveRecord::Migration[6.0]
  def change
    create_table :car_fuels do |t|
      t.string :name

      t.timestamps
    end
  end
end
