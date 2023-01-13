# frozen_string_literal: true

Rails.application.routes.draw do
  root 'lcm_calculator#input'
  post '/show', to: 'lcm_calculator#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
