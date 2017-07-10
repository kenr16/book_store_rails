Rails.application.routes.draw do

  devise_for :users

  resources :accounts do
    resources :orders
  end

  resources :books

  root to: "books#index"
end
