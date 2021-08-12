Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  get 'customers/in', to:'customers#index'
  get 'customers/new', to:'customers#new'
  post 'customers/c', to:'customers#create'
  get '/search', to:'products#search'
  # root 'orders#index'
  resources :products
  resources :orders
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
