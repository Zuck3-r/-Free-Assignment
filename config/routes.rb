Rails.application.routes.draw do
  root 'images#index'
  get 'get_image/:id', to:'images#get_image'
  resources :images do
    resources :likes, only: [:create]
  end
end
