Rails.application.routes.draw do
  resources :products
  get 'home/index'
  resources :users do
    resources :lists
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
