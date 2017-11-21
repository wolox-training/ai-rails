Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'landing#index'
  resources :books, only: [:index, :show] do
    get 'rents'
  end
  
  resources :users do
    get 'rents'
    post 'rents', to: 'users#create_rent'
  end
  # get 'users/:user_id/rents', to: 'users#rents'
  # get 'books/:book_id/rents', to: 'books#rents'
  # match "users/:user_id/rents" => "users#create_rent", :via => :post
end
