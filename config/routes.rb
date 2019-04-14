Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :new, :edit]
  post 'songs/upload', to: 'songs#upload'

  resources :artists
end
