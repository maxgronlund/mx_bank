Rails.application.routes.draw do
  namespace :system do
    get 'admin/index'
  end
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
