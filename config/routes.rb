Rails.application.routes.draw do
  resources :inventories
  devise_for :users
  root 'home#index'
end
