Rails.application.routes.draw do
  root 'sessions#new'

  get 'signup', to: 'users#new'
  get 'hosting', to: 'users#hosting'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :events
  resources :sessions
end
