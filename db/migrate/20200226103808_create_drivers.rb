# frozen_string_literal: true

class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :licence
      t.integer :experience
      t.integer :salary
      t.boolean :avail
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
