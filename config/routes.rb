Rails.application.routes.draw do

  root "sessions#new"
  get "new_game"        	=> "game_rounds#new"
  post "players"        	=> "game_rounds#create"
  get "allplayers"     		=> "game_rounds#show"

  get "new_session" 			=> "sessions#new"
  post "create_session" 	=> "sessions#create"
  get "show_movie"			=> "sessions#show"
  put "score_update"		=> "sessions#update"
  delete "destroy_session" => "sessions#destroy"
end
