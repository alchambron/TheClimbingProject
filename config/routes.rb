Rails.application.routes.draw do
  get 'coworkings/index'

  root "home_page#index"
  resources :centers
  resources :subscriptions
  devise_for :users
  resources :courses
  resources :order_courses
  resources :order_subscriptions
  resources :restaurations
  resources :coworkings
  resources :relaxations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
