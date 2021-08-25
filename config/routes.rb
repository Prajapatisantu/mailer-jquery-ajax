require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  get 'customers/in', to:'customers#index'
  get 'customers/new', to:'customers#new'
  post 'customers/c', to:'customers#create'
  get '/search', to:'products#search'
  put '/image_update', to: 'users#image_update'
  # authenticate :user, lambda { |u| u.user? } do
  mount Sidekiq::Web => '/sidekiq'
  # end
  get '/export', to: 'products#export'
  resources :products 
  resources :orders
  resources :users
end
