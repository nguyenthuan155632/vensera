Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  namespace :shop do
  	resources :products
  end

  root to: 'shop/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
