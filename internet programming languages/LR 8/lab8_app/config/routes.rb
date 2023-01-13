Rails.application.routes.draw do
  root "gcd_calculating#input"
  get 'output', as: 'output', to: 'gcd_calculating#output'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
