Rails.application.routes.draw do
  resources :transaction, only: %i[show]
  resources :account, only: %i[index]
  resources :credits, only: %i[index new create destroy]
  # resources :payments
  resources :permissions, only: %i[edit update]
  namespace :system do
    resources :address_servers
    resources :admins
  end
  namespace :system do
    resources :hosts
  end
  resources :session
  resources :sign_up, only: [:index]
  resources :users, except: [:new]
  get 'home/index'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
