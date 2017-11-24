Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'landing#index'
  resources :books, only: [:index, :show] do
    resources :rents, only: [:index]
  end

  resources :users do
    resources :rents, only: [:create, :index]
  end
end
