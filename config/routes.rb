Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords', unlocks: 'users/unlocks', confirmations: 'users/confirmations', omniauth_callbacks: "users/omniauth_callbacks" }

  namespace :shop do
  	resources :posts, only: [:index, :show]
  	resources :products, only: [:index, :show]

    post 'posts/likes' => 'posts#likes'
  end

  namespace :operators do
    # Category
  	get 'categories' => 'categories#index'
  	post 'categories' => 'categories#create'
  	get 'categories/new' => 'categories#new'
  	get 'categories/:id/edit' => 'categories#edit', as: "categories_edit"
  	put 'categories/:id' => 'categories#update', as: "categories_update"
  	delete 'categories/:id' => 'categories#destroy', as: "categories_delete"
  	post 'categories/delete_selected' => 'categories#delete_selected', as: "categories_delete_selected"

    # Post
  	get 'posts' => 'posts#index'
  	post 'posts' => 'posts#create'
  	get 'posts/new' => 'posts#new'
    get 'posts/:id/edit' => 'posts#edit', as: "posts_edit"
    put 'posts/:id' => 'posts#update', as: "posts_update"
    delete 'posts/:id' => 'posts#destroy', as: "posts_delete"
    post 'posts/delete_selected' => 'posts#delete_selected', as: "posts_delete_selected"

    # Products
    get 'products' => 'products#index'
    post 'products' => 'products#create'
    get 'products/new' => 'products#new'
    get 'products/:id/edit' => 'products#edit', as: "products_edit"
    put 'products/:id' => 'products#update', as: "products_update"
    delete 'products/:id' => 'products#destroy', as: "products_delete"
    post 'products/delete_selected' => 'products#delete_selected', as: "products_delete_selected"

  	root to: 'home#index'
  end

  get 'contact' => 'shop/contact#index'

  root to: 'shop/home#index'
end
