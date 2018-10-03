Rails.application.routes.draw do
  get 'products_controller/new'
  get 'products_controller/create'
  get 'products_controller/update'
  get 'products_controller/edit'
  get 'products_controller/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :products
end
