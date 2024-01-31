# frozen_string_literal: true

Rails.application.routes.draw do
  resources :inventories, except: %i[edit update]
  resources :recipes
  devise_for :users
  root 'home#index'
  get '/foods', to: 'foods#index'
  get '/foods/new', to: 'foods#new', as: 'new_food'
  resources :foods, only: [:create,:destroy]
  resources :foods do
    member do
      get 'detailed_food'
    end
  end

end
