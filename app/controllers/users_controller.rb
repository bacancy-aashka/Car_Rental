# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_params, only: [:create]
  before_action :set_role, only: [:create]

  def index
    byebug
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    role = set_role[:role].downcase
    @user.add_role role
    if @user.save!
      flash[:success] = 'Successfully User Created With Role: ' + role
      redirect_to root_path
    else
      flash[:success] = 'Successfully User Created With Role: ' + role
      redirect_to root_path
      end

    byebug
  end

  def view
    @users = User.all
  end

  def view_addr
    @address = Address.where('user_id=?', params[:id])
  end

  private

  def set_id
    params.permit(:id)
  end

  def set_role
    params.require(:user).permit(:role)
  end

  def set_params
    params.require(:user).permit(:fname, :lname, :contact, :dob, :gender, :email, :password)
  end
end
