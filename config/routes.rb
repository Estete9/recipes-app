# frozen_string_literal: true

Rails.application.routes.draw do
  resources :inventories, except: %i[edit update]
  devise_for :users
  root 'home#index'
end
