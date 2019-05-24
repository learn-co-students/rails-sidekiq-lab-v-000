Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'songs/upload', to: 'songs#upload'
  resources :songs, only: [:show, :index, :edit, :new]
  resources :artists, only: [:show]
end
