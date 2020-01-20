Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  get 'events/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
