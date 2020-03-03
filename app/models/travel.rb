class Travel < ApplicationRecord
  belongs_to :booking
  belongs_to :address

  TYPE = %w[PICKUP DROP BOTH]
end
