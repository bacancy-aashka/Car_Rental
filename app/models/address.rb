# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user
  has_many :travels, dependent: :destroy

  validates :state, :city, :location, :zip,
            presence: true

  validates :zip, 
            numericality: { only_integer: true}, 
            length: {is: 6},if: :zip_present? 

  private

  def zip_present?
    zip.present?
  end
end
