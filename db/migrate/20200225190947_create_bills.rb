class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.references :booking, null: false, foreign_key: true
      t.float :total_kms
      t.float :actual_km
      t.float :toll_tax
      t.float :tax
      t.float :amount
      t.float :total

      t.timestamps
    end
  end
end
