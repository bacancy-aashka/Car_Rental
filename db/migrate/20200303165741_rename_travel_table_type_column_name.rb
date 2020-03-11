# frozen_string_literal: true

class RenameTravelTableTypeColumnName < ActiveRecord::Migration[6.0]
  def change
    change_column :travels, :type, :string
  end
end
