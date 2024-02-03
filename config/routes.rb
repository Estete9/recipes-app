# frozen_string_literal: true

Rails.application.routes.draw do
  get 'shopping/generate_shopping_list',to: 'shopping#generate_shopping_list', as: 'generate_shopping_list'
  resources :food_recipes, only: [:new, :create, :destroy]
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
