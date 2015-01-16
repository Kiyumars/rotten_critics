Rails.application.routes.draw do

  get 'games/new'

  get 'games/create'

  get 'games/edit'

  get 'games/update'

  get 'games/destroy'

  root "actors#new"
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


end
