Rails.application.routes.draw do
   devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :users do
    resources :groups, only: [:index, :new, :create,:show,:destroy]
    resources :transactions, only: [:index, :new, :create,:show,:destroy]
  end
end
