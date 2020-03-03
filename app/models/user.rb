class User < ApplicationRecord
  rolify
  has_one :customer, dependent: :destroy
  has_one :driver
  has_many :addresses
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :add_default_role, :add_user

  GENDER = %w[Male Female Other]


  def add_default_role    
    self.add_role(:customer) if self.roles.blank? 
  end

  def add_user
    Customer.create!(user: self)
  end
end
