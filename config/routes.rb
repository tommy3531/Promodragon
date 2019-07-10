require 'sidekiq/web'

Rails.application.routes.draw do
  
  get 'forum/index'
  get 'green_room/show'
  get 'users/:id/profile', to: 'profiles#show'
  get 'posts/:id/comments', to: 'comments#show'
  resources :business_cards


  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :services

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users do
    resource :profile
  end

  resources :posts do
    resources :comments
  end
  

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
