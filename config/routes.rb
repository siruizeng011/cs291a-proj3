Rails.application.routes.draw do
  root "users#index"

  resources :users do
    resources :posts, only: [:show, :create]
  end

  resources :posts, only: [:show, :destroy] do
    resources :comments, only: [:index, :show, :create]
  end

  match "*path", to: "errors#not_found", via:  :all

end
