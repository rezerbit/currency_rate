Rails.application.routes.draw do
  root to: 'tickers#show'
  get '/admin', to: 'forced_rates#new'

  resource :ticker, only: :show
  resources :forced_rates, only: %i[new create]

  namespace :api do
    resource :current_rate, only: :show
  end

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  mount ActionCable.server, at: '/cable'
end
