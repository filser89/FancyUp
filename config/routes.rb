Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "users" , to: "users#login", as: "login"
      resources :users, only: [:update]
      resources :rentals, only: [:index, :show, :create, :update, :destroy] do
        resources :orders, only: [:create]
      end
      resources :orders, only: [:index, :show, :update, :destroy]
    end
  end
end
