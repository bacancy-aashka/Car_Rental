class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :seats
      t.integer :luggage
      t.integer :min_kms
      t.integer :cost_per_km
      t.boolean :avail
      t.references :car_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
