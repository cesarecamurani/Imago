Rails.application.routes.draw do
  get 'search/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "home#index"
  get 'home/index'

  get 'search' => 'search#index'

  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create]
end
