Rails.application.routes.draw do

  root "games#new"

  resources :games,  only: [:new, :create, :destroy] do
    resources :movies, only: [:new, :create, :edit, :update]
  end
end
