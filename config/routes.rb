Rails.application.routes.draw do
  root 'statuses#show'

  resource :health, only: [:show], controller: :health
  resource :status, only: [:show]

  namespace :crud_app do
    resources :stats, only: [:index]
    resources :workers, only: [:create, :destroy]
  end

  namespace :echo_app do
    resources :messages, only: [:index]
  end

  namespace :prometheus_app do
    resources :stats, only: [:index]
  end

  namespace :otel_app do
    resources :stats, only: [:index]
  end

  namespace :distributed_echo_app do
    resources :messages, only: [:index]
  end

  mount Sidekiq::Web => '/sidekiq'
  mount Yabeda::Prometheus::Exporter, at: '/metrics'
end
