Rails.application.routes.draw do
  resources :comments
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  resources :users
  resource :user
  resource :session, only: [:new, :destroy, :create]

    # edit
  # get 'questions/:id/edit', to: 'questions#edit', as: :edit_question

  # update
  # patch 'questions/:id', to: 'questions#update'

  get "user/:id/changepassword", to: 'users#change_password', as: :change_password
  patch "user/:id/changepassword", to: 'users#change_password'


  resources :posts do

    resources :comments, only: [:create, :destroy]

  end



end
