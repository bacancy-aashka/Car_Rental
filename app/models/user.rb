# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  has_one :users_role
  has_one :customer, dependent: :destroy
  has_one :driver
  has_many :addresses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :add_default_role, :add_user

  validates :fname, :lname, :contact, :dob, :gender,
            presence: true
  
  validates :email,
            uniqueness: true, 
            format: {with: /\A[a-zA-Z]+[\.?\w]*@([a-zA-Z])+(\.[a-z]{2,3})+\Z/,
            message: "Invalid Format Of Email ID..!!"}, if: :email_present?
  
  validates :password,
            length: {minimum: 8},
            confirmation: true, if: :password_present?

  # validates :password_confirmation, 
            # presence: true, if: :password_present?

  GENDER = %w[Male Female Other].freeze
  ROLE = %w[driver admin].freeze

  # default_scope { eager_load(users_role: :role) }

  private

  def email_present?
    email.present?
  end

  def password_present?
    password.present?
  end

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
