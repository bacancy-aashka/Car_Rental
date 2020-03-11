# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    if user_signed_in?
      if current_user.has_role? :customer
        redirect_to customers_index_path
      elsif current_user.has_role? :driver
        redirect_to drivers_index_path
      elsif current_user.has_role? :admin
        redirect_to admins_index_path
      else
        redirect_to superadmins_index_path
      end
    end
  end
end
