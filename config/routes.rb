Rails.application.routes.draw do
  root 'users#new'
  get 'customers/in', to:'customers#index'
  get 'customers/new', to:'customers#new'
  post 'customers/c', to:'customers#create'
  # root 'orders#index'
  resources :products
  resources :orders
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
