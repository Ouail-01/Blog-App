Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#index'

  # Defines the root path route ("/")

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create, :destroy] do
      resources :comments, only: [:new, :index, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end

  post '/users/:id/posts/create', to: 'posts#create'
end
