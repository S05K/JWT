Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  put 'forgot_passwords/verify_otp', to: 'forgot_passwords#verify_otp'
  resources :forgot_passwords
  resources :users
  post '/auth/login', to: 'authentication#login'
  delete 'auth/destroy', to: 'authentication#destroy'
end
