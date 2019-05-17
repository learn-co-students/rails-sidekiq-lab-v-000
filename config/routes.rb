Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'songs/upload' => 'songs#upload'

  resources :artists
  resources :songs
end
