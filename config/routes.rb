Rails.application.routes.draw do
  devise_for :users
  resources :notifications, :outflows, :suppliers, :supply_product_links
  root to: 'inflows#index'
  resources :inflows do
    collection do
      get '/expand/:id', to: 'inflows#expand', as: :expand
      post 'add_items', to: 'inflows#add_items', as: :add_items
    end
  end
  resources :products do
    collection do
      get 'mass_stock'
      post 'mass_stock_update'
    end
  end
  resources :supplies do
    collection do
      get 'mass_stock'
      post 'mass_stock_update'
    end
  end
  get 'statistics', to: 'pages#statistics', as: :statistics
  get 'take', to: 'pages#take', as: :take

end
