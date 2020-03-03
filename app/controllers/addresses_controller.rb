class AddressesController < ApplicationController
  before_action :address_params, only: [:create]
  before_action :set_params, only: [:new, :create]
  def index
    @cities = CS.cities(params[:state])
  end

  def new
    @address = Address.new
    @booking = set_params
    byebug
  end
  def create

    @address = Address.new(address_params)
    @address.user_id = current_user.id
    @booking = set_params
    byebug

    respond_to do |format|
      if @address.save
        format.html { redirect_to create_booking_path(@booking[:id],@booking), notice: 'Address was successfully created.' }
      else
        format.html { render :new }
      end
    end
    	
  end
  private
  
  def address_params
    params.require(:address).permit(:location, :city, :state, :zip)
  end
  def set_params
    if params[:address]
      params.require(:address).permit(:from_date, :from_time, :to_date, :to_time, :fuel_name, :fuel_type, :want_driver, :diff_loc,:id)
    else
      params.permit(:from_date, :from_time, :to_date, :to_time, :fuel_name, :fuel_type, :want_driver, :diff_loc, :id)
    end
  end
end