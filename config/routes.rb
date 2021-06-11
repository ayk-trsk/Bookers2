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
      get 'date_search', to: 'users#date_search'
  end

  get 'search' => 'searches#search'
  get 'category_search' => 'books#category_search'
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  resources :groups do
    get "join" => "groups#join"
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end

end
