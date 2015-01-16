Rails.application.routes.draw do

  root "games#new"
  get "new_game"        	=> "game_rounds#new"
  post "players"        	=> "game_rounds#create"
  get "allplayers"     		=> "game_rounds#show"

  get "new_session" 			=> "sessions#new"
  post "create_session" 	=> "sessions#create"
  get "show_movie"			=> "sessions#show"
  patch "score_update"		=> "sessions#update"
  delete "destroy_session" => "sessions#destroy"

  # get "new_actor"         => "actors#new"
  # post "create_actor"     => "actors#create"
  # get "show_actor"        => "actors#show"
  # delete "destroy_actor"  => "actor#destroy"

  resources :actors, only: [:new, :create, :show]
  resources :movies, only: [:create]
  resources :games,  only: [:new, :create, :edit, :update, :destroy]


end
