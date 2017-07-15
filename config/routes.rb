Rails.application.routes.draw do
  root 'pages#index'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/dashboard', to: 'dashboard#show', as: 'dashboard'
end
