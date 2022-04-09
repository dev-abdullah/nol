Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :users, only: [:create]

      post "/login", to: "auth#login"
      post "/auto_login", to: "auth#auto_login"

      resources :stations, only: [:index]
      resources :cards, only: [:show, :update]
      resources :transactions, only: [:index, :create, :show]
    end
  end
  get "/home", to: "application#home"
end
