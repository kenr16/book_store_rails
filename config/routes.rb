Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  resources :accounts do
    resources :orders
  end

  resources :orders do
    resources :order_items
  end

  resources :books

  root to: "books#index"
end
