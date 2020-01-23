Rails.application.routes.draw do
  get 'invitations/new'
  get 'invitations/create'
  post 'invitations/:id', to: 'invitations#accept'
  root 'users#new'

  get 'signup', to: 'users#new'
  get 'hosting', to: 'users#hosting'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :events
  resources :sessions
  resources :invitations do
    member do
      post :accept
    end
  end
end
