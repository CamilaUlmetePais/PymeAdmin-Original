Rails.application.routes.draw do
  root to: 'inflows#index'
  resources :products
  resources :suppliers
  resources :inflows
  resources :outflows
  resources :notifications
  resources :supplies
  resources :supply_product_links
 	get 'take', to: 'pages#take', as: :take
 	get 'statistics', to: 'pages#statistics', as: :statistics
end
