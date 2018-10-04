Rails.application.routes.draw do
  # get 'review/create'
  # get 'review/edit'
  # get 'review/update'
  # get 'review/destroy'
  root to: "products#index"

  resources :products do
  resources :reviews, except: [:index, :new, :show]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :products
 resources :users
 resources :sessions
end
