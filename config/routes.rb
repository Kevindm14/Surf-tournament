Rails.application.routes.draw do
  root 'tournaments#index'
  resources :participants
  resources :tournaments
  resources :categories
end
