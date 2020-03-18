# frozen_string_literal: true

class CarTypesController < ApplicationController
  before_action :set_car_type, only: %i[show edit update destroy]

  def index
    @car_types = CarType.all
  end

  def new
    @car_type = CarType.new
  end

  def edit; end

  def create
    @car_type = CarType.new(car_type_params)

    respond_to do |format|
      if @car_type.save
        flash[:success] = 'Car Type Created Successfully'
        format.html { redirect_to new_car_type_path }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @car_type.update(car_type_params)
        flash[:success] = 'Car Type Updated Successfully'
        format.html { redirect_to @car_type }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @car_type.destroy
    respond_to do |format|
      format.html { redirect_to car_types_url, notice: 'Car type was successfully destroyed.' }
    end
  end

  private

  def set_car_type
    @car_type = CarType.find(params[:id])
  end

  def car_type_params
    params.require(:car_type).permit(:name)
  end
end
