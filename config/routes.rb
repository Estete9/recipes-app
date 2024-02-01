# frozen_string_literal: true

Rails.application.routes.draw do
  resources :food_inventories, only: [:new, :create, :destroy]
  resources :public_recipes, only: [:index]
  resources :inventories, except: [:edit, :update]
  resources :recipes, except: %i[edit]
  devise_for :users
  root 'home#index'
  get '/foods', to: 'foods#index'
  get '/foods/new', to: 'foods#new', as: 'new_food'
  resources :foods, only: [:create,:destroy]
end
