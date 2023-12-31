Rails.application.routes.draw do
   devise_for :users, controllers: {
        sessions: 'users/sessions',
        passwords:'users/passwords',
        registrations:'users/registrations',
        confirmations:'users/confirmations',
      }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :users do
    resources :groups, only: [:index, :new, :create,:show,:destroy] do
    resources :entities, only: [:index,:show,:destroy,:new, :create]
    end
  end
end
