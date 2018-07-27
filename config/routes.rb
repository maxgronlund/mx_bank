Rails.application.routes.draw do
  resources :permissions, only: [:edit, :update]
  namespace :system do
    resources :address_servers
    get 'admin/index'
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
