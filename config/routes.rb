Rails.application.routes.draw do
  resources :artists
  resources :songs
  post 'songs/upload' => 'songs#upload'
end
