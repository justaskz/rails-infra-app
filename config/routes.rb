Rails.application.routes.draw do
  root 'statuses#show'

  resource :status, only: [:show]

  scope module: 'crud_app' do
    resources :stats, only: [:index]
    resources :workers, only: [:create, :destroy]
  end

  mount Sidekiq::Web => '/sidekiq'
end
