Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index, :destroy]
  resources :goals

  root to: "users#index"
end
