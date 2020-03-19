# frozen_string_literal: true

module SuperadminsHelper
  def get_user
    User.group_by_day(:created_at)
  end

  def get_car_type
    Car.joins(:car_type).group("car_types.name")
  end
end
