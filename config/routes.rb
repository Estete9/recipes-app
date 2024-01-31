# frozen_string_literal: true

Rails.application.routes.draw do
  resources :inventories, except: %i[edit update]
  resources :recipes
  devise_for :users
  root 'home#index'
end
