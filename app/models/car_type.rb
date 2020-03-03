class CarType < ApplicationRecord
    has_many :cars

    FUEL = %w[Petrol Diesel Gas]
    TYPE = %w[Hatchback Sedan SUV Van Convertible]
end
