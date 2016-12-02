Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations' }

  namespace :shop do
  	resources :posts
  	resources :products
  end

  namespace :operators do
  	root to: 'home#index'
  end

  get 'contact' => 'shop/contact#index'

  root to: 'shop/home#index'
end
