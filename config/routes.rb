Rails.application.routes.draw do
  resources :images
  root 'images#index'
  get 'get_image/:id', to:'images#get_image'
end
