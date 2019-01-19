Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  get 'home/index'

  root to: "home#index"

  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create]
end
