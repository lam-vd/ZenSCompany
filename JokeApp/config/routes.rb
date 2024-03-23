Rails.application.routes.draw do
  resources :jokes
  root "jokes#index"
end
