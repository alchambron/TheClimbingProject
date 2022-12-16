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

    root to: 'users#index'
  end
  get 'coworkings/index'
  root 'home_page#index'
  resources :centers
  resources :subscriptions
  devise_for :users
  resources :users
  resources :order_courses

  scope '/courses' do
    get '/', to: redirect("/courses/1"), as: 'courses'
    get ":center_id", to: 'courses#index', as: 'courses_from_center'
  end

  scope '/order_courses' do
    post 'book_course', to: 'order_courses#book_course', as: 'order_course_book_course'
    post 'refund_course', to: 'order_courses#refund_course', as: 'order_course_refund_course'
  end

  scope '/order_subscriptions' do
    post 'book_subscription', to: 'order_subscriptions#book_subscription', as: 'order_subscription_book_subscription'
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
    get 'refund', to: 'checkout#refund', as: 'checkout_refund'
  end

  scope '/checkout_subscription' do
    get 'create', to: 'checkout_subscription#create', as: 'checkout_subscription_create'
    get 'cancel', to: 'checkout_subscription#cancel', as: 'checkout_subscription_cancel'
    get 'success', to: 'checkout_subscription#success', as: 'checkout_subscription_success'
  end
end
