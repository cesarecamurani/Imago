Rails.application.routes.draw do

  get 'search/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "home#index"
  get 'home/index'

  get 'search' => 'search#index'

  resources :posts, only: [:new, :create, :destroy] do
    resources :likes, :comments, :only => [:create, :index, :new]
  end
  resources :comments, :only => [:destroy, :show, :edit, :update]
  resources :users, only: [:show, :edit, :update]
  # resources :posts, only: [:new, :create]

end
