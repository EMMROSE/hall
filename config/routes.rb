Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'admin', to: 'pages#admin'
  get 'mentions_legales', to: 'pages#mentions_legales'

  resources :owners
    get 'owners/:id/research', to: "owners#research", as: "owner_research"
  resources :shops
  resources :shop_categories

  resources :products
    get 'products/:id/research', to: "products#research", as: "product_research"

  resources :items
  resources :line_items
    post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
    post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_item_reduce"

  resources :carts
  resources :orders do
    resources :payments, only: :new
  end
  post 'without_login', to: 'orders#without_login'
  # resources :contacts, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
