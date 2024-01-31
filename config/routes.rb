# frozen_string_literal: true

Rails.application.routes.draw do
  resources :inventories, except: %i[edit update]
  devise_for :users
  root 'home#index'
  get '/foods', to: 'foods#index'
  get '/foods/new', to: 'foods#new', as: 'new_food'
  resources :foods, only: [:create,:destroy]
end
