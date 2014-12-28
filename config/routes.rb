Rails.application.routes.draw do
  root "game_rounds#new"
  get "new_game"        => "game_rounds#new"
  get "next_round"      => "game_rounds#update"

end
