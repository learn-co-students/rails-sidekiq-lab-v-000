Rails.application.routes.draw do
  post '/upload' => 'songs#upload', as: 'songs_upload'
      resources :songs
      resources :artists
end
