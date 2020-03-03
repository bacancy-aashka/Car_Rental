class TravelsController < ApplicationController
  def index
    byebug
  end
  private
  def set_params
    if params[:diff_loc] == "true"
      params.permit(:from_date, :from_time, :to_date, :to_time, :fuel_name, :fuel_type, :want_driver, :diff_loc, :car_id, :address, :state, :city, :zipcode, :address_drop, :state_drop, :city_drop, :zipcode_drop)
    else
      params.permit(:from_date, :from_time, :to_date, :to_time, :fuel_name, :fuel_type, :want_driver, :diff_loc, :car_id, :address, :state, :city, :zipcode)
    end
  end
end
