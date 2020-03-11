# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user
  has_many :travels, dependent: :destroy
end
