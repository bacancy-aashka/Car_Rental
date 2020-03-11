# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :address_params, only: [:create]
  before_action :set_params, only: %i[new create]
  before_action :set_address, only: %i[show edit update destroy]

  def index
    @cities = CS.cities(params[:state])
  end

  def new
    @address = Address.new
    @booking = set_params
    # byebug
  end

  def edit
    @booking = set_params
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    @booking = set_params
    respond_to do |format|
      if @address.save
        if @booking.empty?
          format.html { redirect_to view_addr_path(current_user.id), notice: 'Address was successfully created.' }
        else
          format.html { redirect_to create_booking_path(@booking[:id], @booking), notice: 'Address was successfully created.' }
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to view_addr_path(@address.user_id), notice: 'Address was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to view_addr_path(@address.user_id), notice: 'Address was successfully destroyed.' }
    end
  end

  private

  def address_params
    params.require(:address).permit(:location, :city, :state, :zip)
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def set_params
    if params[:address]
      params.require(:address).permit(:from_date, :from_time, :to_date, :to_time, :fuel_name, :fuel_type, :want_driver, :diff_loc, :id)
    else
      params.permit(:from_date, :from_time, :to_date, :to_time, :fuel_name, :fuel_type, :want_driver, :diff_loc, :id)
    end
  end
end
