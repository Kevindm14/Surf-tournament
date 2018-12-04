Rails.application.routes.draw do
  get 'categories/index'
  root 'tournaments#index'
  resources :participants
  resources :tournaments
  resources :categories
end
