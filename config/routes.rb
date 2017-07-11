Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }

  resources :accounts do
    resources :orders
  end

  resources :orders do
    resources :order_items
  end

  resources :charges

  resources :books

  root to: "books#index"
end
