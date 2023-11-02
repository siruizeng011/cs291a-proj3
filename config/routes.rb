Rails.application.routes.draw do
  root "users#index"

  resources :users do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:show] do
    resources :comments, only: [:index, :show]
  end
end
