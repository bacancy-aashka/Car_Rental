# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  has_one :customer, dependent: :destroy
  has_one :driver
  has_many :addresses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :add_default_role, :add_user

  GENDER = %w[Male Female Other].freeze
  ROLE = %w[driver admin].freeze
  private
  
  def add_default_role
    add_role(:customer) if roles.blank?
  end

  def add_user
    if has_role? :customer
      Customer.create!(user: self)
    elsif has_role? :driver
      Driver.create!(user: self)
    end
  end
end
