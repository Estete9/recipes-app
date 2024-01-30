Rails.application.routes.draw do
  resources :inventories, except: [:edit, :update]
  devise_for :users
  root 'home#index'
end
