# frozen_string_literal: true

class CreateDriverRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :driver_requests do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
