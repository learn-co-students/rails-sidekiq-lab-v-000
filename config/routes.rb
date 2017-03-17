Rails.application.routes.draw do
  resources :artists, :songs
  post 'songs/upload', to: 'songs#upload'
  get '/clear', to: 'songs#clear_songs'

end