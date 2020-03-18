# frozen_string_literal: true

class AddDriverAmtToBill < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :driver_amt, :float
  end
end
