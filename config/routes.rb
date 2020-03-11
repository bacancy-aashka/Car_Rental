# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'dashboards#index'

  devise_for :users

  get 'customers/index'
  get 'drivers/index'
  get 'admins/index'
  get 'superadmins/index'

  get 'bills/index'
  get 'bookings/show'
  get 'bookings/book/:id' => 'bookings#create_booking', as: :create_booking
  get 'addresses/create/:id' => 'addresses#new', as: :create_address
  post 'create_user' => 'users#create', as: :create_user
  get 'view_user' => 'users#view', as: :view_user
  get 'view_addr/:id' => 'users#view_addr', as: :view_addr

  # get 'superadmins/add_driver' => "superadmins#add_driver", as: :add_driver
  # post 'bookings/book/:id' => "bookings#create_booking", as: :create_booking
  # get "users/show/:id" => "users#show", as: :show_user

  resources 'bookings'
  resources 'addresses'
  resources 'travels'
  resources 'cars'
  resources 'car_types'
  resources 'users', except: :create

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
