Rails.application.routes.draw do
  root 'statuses#show'

  resource :health, only: [:show], controller: :health
  resource :status, only: [:show]

  namespace :prometheus_app do
    resources :stats, only: [:index]
  end

  namespace :crud_app do
    resources :stats, only: [:index]
    resources :workers, only: [:create, :destroy]
  end

  mount Sidekiq::Web => '/sidekiq'
end
