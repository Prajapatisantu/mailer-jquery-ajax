Rails.application.routes.draw do
  # get 'products/index', to:'products#index'
  # get 'products/new', to:'products#new'
  # post 'products/create', to:'products#create'
  get 'customers/in', to:'customers#index'
  get 'customers/new', to:'customers#new'
  post 'customers/c', to:'customers#create'
  # root 'products#index'
  root 'orders#index'
  resources :products
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
