# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/users/:id/discover', to: 'users#discover'
  post '/users/:id/search', to: 'movies#index'
  get '/register', to: 'users#new'
  # get '/login', to: 'users#login_form'
  # post '/login', to: 'users#login_user'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'

  resources :users, only: %i[show new create] do
    resources :movies, only: %i[show index] do
      resources :view_parties, only: %i[new create]
    end
  end
end
