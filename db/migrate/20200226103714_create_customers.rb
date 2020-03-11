# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :licence
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
