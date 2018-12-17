Rails.application.routes.draw do
  root 'tournaments#index'
  resources :users
  resources :tournaments do
    resources :categories do
      resources :groups, only: [:edit, :update]
    end
  end
  resources :participants
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }
end
