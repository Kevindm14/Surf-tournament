Rails.application.routes.draw do
  root 'tournaments#index'
  resources :tournaments
end
