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
  get 'product/newlisting', to: 'products#newlisting'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
