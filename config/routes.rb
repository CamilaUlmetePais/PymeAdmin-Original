Rails.application.routes.draw do
  resources :outflows
  resources :suppliers
  root to: 'inflows#index'
  resources :inflows
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
