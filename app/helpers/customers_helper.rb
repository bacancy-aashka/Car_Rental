# frozen_string_literal: true

module CustomersHelper
  def get_car
    CarType.all
  end

  def get_car_fuel
    CarFuel.all
  end
end
