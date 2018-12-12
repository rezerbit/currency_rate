Rails.application.routes.draw do
  root to: 'rates#show'
  resource :rate, only: [:show]

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  mount ActionCable.server, at: '/cable'
end
