Rails.application.routes.draw do
  root "lcm_calculator#input"
  get 'show', as: 'show', to: "lcm_calculator#show"
  get 'bd', to: "lcm_calculator#xml"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
