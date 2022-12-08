Rails.application.routes.draw do
  get 'checkout/create'
  get 'checkout/success'
  get 'checkout/cancel'
  get 'cart/list_course'
  get 'cart/add_course'
  get 'cart/delete_course'
  get 'cart/list_subscription'
  get 'cart/add_subscription'
  get 'cart/delete_subscription'
  get 'cart/save_to_session'
  get 'users/show'

  root "home_page#index"
  resources :centers
  resources :subscriptions
  devise_for :users
  resources :courses
  resources :order_courses
  resources :order_subscriptions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
