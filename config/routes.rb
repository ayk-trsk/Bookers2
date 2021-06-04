Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "home/about" => 'homes#about'
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users do
    member do
     get :following, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  
  get 'search' => 'searches#search'
  
end