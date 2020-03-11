# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.integer :contact
      t.date :dob
      t.string :gender

      t.timestamps
    end
  end
end
