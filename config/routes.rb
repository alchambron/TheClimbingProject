Rails.application.routes.draw do
  scope '/cart' do
    get 'list_courses', to: 'cart#list_courses', as: 'cart_list_courses'
    post 'add_course', to: 'cart#add_course', as: 'cart_add_course'
    delete 'delete_course/:id', to: 'cart#delete_course', as: 'cart_delete_course'

    get 'list_subscriptions', to: 'cart#list_subscriptions', as: 'cart_list_subscriptions'
    post 'add_subscription', to: 'cart#add_subscription', as: 'cart_add_subscription'
    delete 'delete_subscription/:id', to: 'cart#delete_subscription', as: 'cart_delete_subscription'
  end
  get 'users/show', to: 'users#show'

  root 'home_page#index'
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

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
end
