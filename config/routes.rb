Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'landing#index'
  resources :books, only: [:index, :show]
end
