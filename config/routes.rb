Rails.application.routes.draw do
  resources :groups, only: [:edit, :update]
  root 'tournaments#index'
  resources :users
  resources :tournaments do
    resources :categories
  end
  resources :participants
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }
end
