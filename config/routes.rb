Rails.application.routes.draw do
  resources :comments
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  resources :user, only: [:new, :create]
  resource :sessions, only: [:new, :destroy, :create]


  resources :posts do

    resources :comments, only: [:create, :destroy]

  end
end
