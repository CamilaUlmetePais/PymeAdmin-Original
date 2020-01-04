Rails.application.routes.draw do
  root to: 'inflows#index'
  resources :products do
  	collection do
  		get 'mass_stock'
  		post 'mass_stock_update'
  	end
  end
  resources :inflows
  resources :notifications
  resources :outflows
  resources :suppliers
  resources :supplies
  resources :supply_product_links
 	get 'statistics', to: 'pages#statistics', as: :statistics
  get 'take', to: 'pages#take', as: :take
end
