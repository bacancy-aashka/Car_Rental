Rails.application.routes.draw do
  
  root to: 'dashboards#index'
  
  devise_for :users
  
  get 'customers/index'
  get 'drivers/index'
  get 'admins/index'
  get 'superadmins/index'

  get 'car_types/index'
  get 'cars/index'
  get 'car_type/index'
  get 'car/index'
  get 'bills/index'
  post 'travels/index'
  get 'bookings/show'
  get 'bookings/book/:id' => "bookings#create_booking", as: :create_booking
  get 'addresses/create/:id' => "addresses#new", as: :create_address
  
  # post 'bookings/book/:id' => "bookings#create_booking", as: :create_booking
  # get "users/show/:id" => "users#show", as: :show_user

  resources 'bookings'
  resources 'addresses'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
