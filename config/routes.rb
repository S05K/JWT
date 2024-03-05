Rails.application.routes.draw do
  get 'buses/index'


   mount ActionCable.server => '/cable'
  root 'home#index'
  # get 'home/index'
  get 'qr_codes/generate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'authors/index'
  get 'posts/index'
  get 'categories/index'
  get 'categories/create'
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  put 'forgot_passwords/verify_otp', to: 'forgot_passwords#verify_otp'
  post '/auth/login', to: 'authentication#login'
  get 'buses/get_buses', to: 'buses#get_buses'
  post '/buses/:id/calculate_total_price', to: 'buses#calculate_total_price'
  resources :buses
  resources :hello
  resources :payments
  resources :forgot_passwords
  resources :users
  resources :categories
  resources :subcategories
  resources :assign_subs
  resources :subcsriptions
  resources :posts
  resources :authors
  post '/generate_qr_codes', to: 'qr_codes#generate'
  get 'get_authors', to: 'authors#get_authors'
  get 'get_subs', to: 'assign_subs#get_subs'
  get 'get_data', to: 'users#get_data'
  delete '/delete_user', to: 'users#delete_user'
  post '/cancel_delete_account', to: 'users#cancel_delete_account'
  delete 'auth/destroy', to: 'authentication#destroy'
end
