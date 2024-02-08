Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/create'
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  put 'forgot_passwords/verify_otp', to: 'forgot_passwords#verify_otp'
  resources :payments
  resources :forgot_passwords
  resources :users
  resources :categories
    
  get 'get_data', to: 'users#get_data'
  delete '/delete_user', to: 'users#delete_user'
  post '/cancel_delete_account', to: 'users#cancel_delete_account'
  post '/auth/login', to: 'authentication#login'
  delete 'auth/destroy', to: 'authentication#destroy'
end
