Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :item do
    resources :orders
    resources :purchases
  end
end
