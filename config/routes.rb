Rails.application.routes.draw do
  root 'stats#status'

  resources :stats, only: [:index]
  resources :workers, only: %i[create destroy]

  mount Sidekiq::Web => '/sidekiq'
end
