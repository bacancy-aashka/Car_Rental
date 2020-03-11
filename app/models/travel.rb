# frozen_string_literal: true

class Travel < ApplicationRecord
  belongs_to :booking
  belongs_to :address
end
