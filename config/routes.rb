Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songs, only: [:index, :show, :edit, :new]
    resources :artists, only: [:index, :show]
    post 'songs/upload', to: 'songs#upload'

end
