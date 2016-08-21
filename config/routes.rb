Rails.application.routes.draw do
  resources :artists, :songs
  post 'songs/upload', to: 'songs#upload'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
