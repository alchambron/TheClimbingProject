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
  get 'coworkings/index'
  get 'users/show', to: 'users#show'
  root 'home_page#index'

  resources :centers
  resources :subscriptions
  devise_for :users
  resources :courses
  resources :order_courses

  scope '/order_courses' do
    post 'book_course', to: 'order_courses#book_course', as: 'order_course_book_course'
  end
  resources :order_subscriptions
  resources :restaurations
  resources :coworkings
  resources :relaxations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
end
