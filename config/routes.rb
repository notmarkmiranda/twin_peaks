Rails.application.routes.draw do
  root 'pages#index'

  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    patch '/deactivate', to: 'users/deactivate#update'
    patch '/activate', to: 'users/activate#update'
  end
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'dashboard#show', as: 'dashboard'

  get '/notfound', to: 'pages#not_found', as: 'not_found'
end
