Rails.application.routes.draw do
  resources :routes
  resources :blocks
  
  namespace :admin do
      resources :users
      resources :centers do
        delete :thumbnail, on: :member, action: :destroy_thumbnail 
      end
      resources :subscriptions
      resources :courses
      resources :coworkings
      resources :loisirs
      resources :order_subscriptions
      resources :order_courses
      resources :relaxations
      resources :restaurations

      root to: "users#index"
    end
  get 'coworkings/index'

  root "home_page#index"
  resources :centers
  resources :subscriptions
  devise_for :users
  resources :users
  resources :courses
  resources :order_courses

  scope '/order_courses' do
    post 'book_course', to: 'order_courses#book_course', as: 'order_course_book_course'
  end
  resources :order_subscriptions
  resources :restaurations
  resources :coworkings
  resources :relaxations
  resources :loisirs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope '/checkout' do
    get 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
end
