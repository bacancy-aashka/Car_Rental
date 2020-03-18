# frozen_string_literal: true

class DriverRequest < ApplicationRecord
  belongs_to :booking
  belongs_to :driver
end
