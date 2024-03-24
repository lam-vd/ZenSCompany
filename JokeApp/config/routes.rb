Rails.application.routes.draw do
  root "jokes#index"
  resources :jokes, only: [:index, :show] do
    member do
      post 'like', to: 'jokes#like', as: :like
      post 'dislike', to: 'jokes#dislike', as: :dislike
    end
  end
end
