Rails.application.routes.draw do

  resources :songs
    post 'songs/upload', to: 'songs#upload'
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
