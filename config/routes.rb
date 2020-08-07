Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "users", to: "users#login", as: "login"
      resources :users, only: [:show, :update] do
        get :rentals, to: "rentals#list_user_rentals", as: "user_rentals"
        get :orders, to: "orders#list_user_orders", as: "user_orders"

      end
      resources :rentals, only: [:index, :show, :create, :update, :destroy] do
        resources :orders, only: [:create]
      end
      resources :orders, only: [:index, :show, :update, :destroy]
    end
  end
end
