
Rails.application.routes.draw do
  devise_for :users
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
  get 'expenses', to: 'pages#expenses', as: :expenses
  get 'product_statistics', to: 'pages#product_statistics', as: :product_statistics
  get 'profit', to: 'pages#profit', as: :profit
 	get 'sales', to: 'pages#sales', as: :sales
  get 'statistics', to: 'pages#statistics', as: :statistics
  get 'take', to: 'pages#take', as: :take

end
