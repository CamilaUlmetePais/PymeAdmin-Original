Rails.application.routes.draw do
  root to: 'inflows#index'
  resources :inflows
  resources :notifications
  resources :outflows
  resources :products do
    collection do
      get 'mass_stock'
      post 'mass_stock_update'
    end
  end
  resources :suppliers
  resources :supplies do
    collection do
      get 'mass_stock'
      post 'mass_stock_update'
    end
  end
  resources :supply_product_links
 	get 'statistics', to: 'pages#statistics', as: :statistics
  get 'take', to: 'pages#take', as: :take
end
