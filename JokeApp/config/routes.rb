Rails.application.routes.draw do
  # devise_for :users
  root "jokes#index"
  resources :jokes, only: [:index]
  resources :votes, only: [:create]
end
