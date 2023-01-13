Rails.application.routes.draw do
  get 'new_session', to: 'session#new'
  post 'create_session', to: 'session#create'
  get 'destroy_session', to: 'session#destroy'

  resources :exercises, only: %i[new create show edit update destroy]

  resources :users, only: %i[new index create show edit update destroy]
  post 'user/:id/follow', to: 'users#follow', as: 'follow'
  post 'user/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
  post 'user/:id/accept', to: 'users#accept', as: 'accept'
  post 'user/:id/decline', to: 'users#decline', as: 'decline'
  post 'user/:id/cancel', to: 'users#cancel', as: 'cancel'
  post 'show_updres', to: 'users#show_updres'
  post 'update_results', to: 'users#update_results'
  post 'user_search', to: 'users#search'

  get 'competition', to: 'page#competition'
  root 'page#main'
end
