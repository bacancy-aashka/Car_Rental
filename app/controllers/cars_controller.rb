# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = Car.includes(:car_type, :car_fuel).paginate(page: params[:page], per_page: params[:per_page])
    if params[:query].present?
      @cars = Car.searching(params[:query]).paginate(per_page: params[:per_page], page: params[:page])
      # @cars = @cars.paginate(:per_page => 5, :page => params[:page])
      else
      @cars = Car.all.paginate(per_page: params[:per_page], page: params[:page])
      # @cars = @cars.paginate(:per_page => 5, :page => params[:page])
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.avail = true
    respond_to do |format|
      if @car.save
        flash[:success] = 'Car Created Successfully'
        format.html { redirect_to new_car_path }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        flash[:success] = 'Car Updated Successfully'
        format.html { redirect_to  cars_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :seats, :luggage, :min_kms, :cost_per_km, :car_type_id, :model, :car_fuel_id)
  end
end
