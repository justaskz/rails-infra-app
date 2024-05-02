Rails.application.routes.draw do
  root 'statuses#show'

  resources :statuses, only: [:show]
  resources :workers, only: %i[create destroy]

  # resources :stats, only: [:index]

  mount Sidekiq::Web => '/sidekiq'
end
