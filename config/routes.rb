Rails.application.routes.draw do
  root 'statuses#show'

  resource :status, only: [:show]
  resources :workers, only: %i[create destroy]

  resources :stats, only: [:index]

  mount Sidekiq::Web => '/sidekiq'
end
