Rails.application.routes.draw do
  resources :attractions
  #resources :rides
  resources :users

  root "application#home"

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  post "/rides/new", to: "rides#new"

end
