Rails.application.routes.draw do
  devise_for :users
  resources :subcriptions
  resources :courses
  resources :order_courses
  resources :order_subscriptions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
