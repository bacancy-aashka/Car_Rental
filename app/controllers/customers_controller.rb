# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit]
  before_action :set_customer_update, only: %i[update]

  def index
    @booking = Booking.new
  end

  def update
    if @customer.update(customer_params)
      flash[:success] = 'Licence Added/Updated Successfully'
      redirect_to customer_path
    else
      render :new
    end
  end

  def show; end

  private

  def set_customer
    @customer = Customer.find_by(user_id: params[:id])
  end

  def set_customer_update
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:licence, :licence_customer_image)
  end
end
