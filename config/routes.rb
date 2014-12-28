Rails.application.routes.draw do
  root "game_rounds#new"
  get "new_game"        => "game_rounds#new"
  post "players"        => "game_rounds#create"
  get "allplayers"      => "game_rounds#show"

end
