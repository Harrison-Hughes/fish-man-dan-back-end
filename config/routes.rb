Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :update, :destroy]
  resources :items, only: [:index, :create, :update, :destroy]
  resources :addresses, only: [:create, :update, :destroy]
  resources :orders, only: [:index, :create, :update, :destroy]
  get "/validate", to: "users#validate"
  post "/login", to: "users#login"
end
