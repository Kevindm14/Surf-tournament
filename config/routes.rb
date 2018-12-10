Rails.application.routes.draw do
  root 'tournaments#index'
  resources :users
  resources :tournaments
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }
end
