# frozen_string_literal: true

class CarFuelsController < ApplicationController
  before_action :set_car_fuel, only: %i[show edit update destroy]

  def index
    @car_fuels = CarFuel.all
  end

  def new
    @car_fuel = CarFuel.new
  end

  def edit; end

  def create
    @car_fuel = CarFuel.new(car_fuel_params)

    respond_to do |format|
      if @car_fuel.save
        flash[:success] = 'Car fuel Created Successfully'
        format.html { redirect_to new_car_fuel_path }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @car_fuel.update(car_fuel_params)
        flash[:success] = 'Car Fuel Updated Successfully'
        format.html { redirect_to @car_fuel }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @car_fuel.destroy
    respond_to do |format|
      flash[:danger] = 'Car Fuel Destroyed Successfully'
      format.html { redirect_to car_fuels_url }
    end
  end

  private

  def set_car_fuel
    @car_fuel = CarFuel.find(params[:id])
  end

  def car_fuel_params
    params.require(:car_fuel).permit(:name)
  end
end
