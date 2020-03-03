class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :from
      t.datetime :to
      t.string :status
      t.boolean :want_driver
      t.string :fuel
      t.references :car, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :driver, foreign_key: true

      t.timestamps
    end
  end
end
