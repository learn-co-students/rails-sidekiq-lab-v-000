Rails.application.routes.draw do
  resources :songs
  resources :artists
  post "songs/upload", to: 'songs#upload'
  get "songs/show", to: "songs#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
