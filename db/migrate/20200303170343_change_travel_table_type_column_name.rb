# frozen_string_literal: true

class ChangeTravelTableTypeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :travels, :type, :addr_type
  end
end
