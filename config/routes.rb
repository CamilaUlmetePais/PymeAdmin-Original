Rails.application.routes.draw do
  root to: 'inflows#index'
  resources :products
  resources :suppliers
  resources :inflows
  resources :outflows
  resources :notifications
end
