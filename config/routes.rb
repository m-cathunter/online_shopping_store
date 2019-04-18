Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#show'
  namespace :admin do
    resources :products, except: [:show]
  end

  resources :products, only: [:index]

  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/order_items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
end
