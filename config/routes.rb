Rails.application.routes.draw do
  resources :products
  devise_for :users
  resources :users


  # resources :users do
  #michael .....
  #   resources :products
  # end
  resources :charges
  
  root 'products#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # if routes doesn't match
  get '*path' => redirect('/')


end
