Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "/users/:id", to: "users#show"

  get "/events", to: "events#index"
  get "/events/new", to: "events#new"
  post "/events", to: "events#create"

  get "/attendances/new", to: "attendances#new"
  post "/attendances/new", to: "attendances#create"
  
  root to: "events#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
