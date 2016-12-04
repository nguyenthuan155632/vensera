Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations' }

  namespace :shop do
  	resources :posts, only: [:index, :show]
  	resources :products, only: [:index, :show]
  end

  namespace :operators do
  	get 'categories' => 'categories#index'
  	post 'categories' => 'categories#create'
  	get 'categories/new' => 'categories#new'
  	get 'categories/:id/edit' => 'categories#edit', as: "categories_edit"
  	put 'categories/:id' => 'categories#update', as: "categories_update"
  	delete 'categories/:id' => 'categories#destroy', as: "categories_delete"
  	post 'categories/delete_selected' => 'categories#delete_selected', as: "categories_delete_selected"

  	get 'posts' => 'posts#index'
  	post 'posts' => 'posts#create'
  	get 'posts/new' => 'posts#new'

  	root to: 'home#index'
  end

  get 'contact' => 'shop/contact#index'

  root to: 'shop/home#index'
end
