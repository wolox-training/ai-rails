Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'landing#index'
  resources :books
  get 'book/show', to:'book#show'
  get 'book/index', to: 'book#index'
end
