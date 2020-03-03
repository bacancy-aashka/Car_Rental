class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :location
      t.string :city
      t.string :state
      t.integer :zip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
