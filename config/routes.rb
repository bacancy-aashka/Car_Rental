# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'dashboards#index'

  devise_for :users

  get 'admins/index'
  get 'superadmins/index'

  get 'bookings/show'
  get 'bookings/book/:id' => 'bookings#create_booking', as: :create_booking
  get 'addresses/create/:id' => 'addresses#new', as: :create_address
  get 'view_user' => 'users#view', as: :view_user
  get 'view_addr/:id' => 'users#view_addr', as: :view_addr
  get 'driver/approve' => 'drivers#approve', as: :driver_approval
  get 'driver/request_approved/:id' => 'driver_requests#accept_request', as: :request_accepted
  get 'driver/request_rejected/:id' => 'driver_requests#reject_request', as: :request_rejected

  # get 'superadmins/add_driver' => "superadmins#add_driver", as: :add_driver
  # post 'bookings/book/:id' => "bookings#create_booking", as: :create_booking
  # get "users/show/:id" => "users#show", as: :show_user

  resources 'drivers' do
    get 'show_booking', on: :collection, action: 'show_booking', as: :show_booking
  end
  resources 'bills', except: :new do
    get 'new_bill/:id', on: :collection, action: 'new', as: :new_bill
    get 'bill_pdf/:id', on: :collection, action: 'bill_pdf', as: :bill_pdf, defaults: { format: 'pdf' }
  end
  resources 'bookings' do
    get 'view_booking', on: :collection, action: 'view_booking', as: :view_booking
  end
  resources 'addresses'
  resources 'travels'
  resources 'cars'
  resources 'car_types'
  resources 'car_fuels'
  resources 'users', except: :create do
    post 'create_user', on: :collection, action: 'create', as: :create_user
  end
  resources 'customers'
  resources 'dashboards', only: [:index] do
    get 'about', on: :collection, action: 'about', as: :about
    get 'contact', on: :collection, action: 'contact', as: :contact
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
