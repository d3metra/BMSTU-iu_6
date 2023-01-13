# frozen_string_literal: true

Rails.application.routes.draw do
  get 'new_session', to: 'sessions#new'
  get 'create_session', to: 'sessions#create_session'
  get 'exit_session', to: 'sessions#exit'
  root 'lcm_calculator#input'
  get 'show', to: 'lcm_calculator#show'
  get 'new_user', to: 'users#new'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
