Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :centers
      resources :courses
      resources :order_courses
      resources :order_subscriptions
      resources :subscriptions

      root to: "users#index"
    end

  root "home_page#index"
  resources :centers
  resources :subscriptions
  devise_for :users
  resources :courses
  resources :order_courses
  resources :order_subscriptions
  resources :restaurations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
