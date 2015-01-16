require 'test_helper'

class GameRoundTest < ActionDispatch::IntegrationTest
  def setup
  	@valid_player_names = "Larry, Curly, Moe"
  	@one_valid_name = "Larry"
  	@invalid_player_names = "7, 7_2, ??%^$"
  	@blank_name = ""
  	@one_blank_name = "Larry,,Curly"
  	@one_invalid_name = "Larry, 42, Moe"
  	@one_duplicate_name = "Larry, Curly, Moe, Larry"
  	@existing_actor = "Al Pacino"
    @new_actor = "John Cazale"
    @invalid_actor = "Ermagehrd Goofbumpths"
  end

  test "create a game session" do
  	get new_game_path
  	assert_response :success
  	assert_difference ["Game.count", "Player.count"], 1 do
  		post games_path, { "actor_name" => @existing_actor,
  													player_names: @one_valid_name }
  	end
  end

  # test "succesfully play one round with existing actor name" do
  # 	get new_game_path
  # 	assert_response :success
  # 	assert_difference ["Game.count", "Player.count"], 1 do
  # 		post game_path, game_form: {"actor_name" => @existing_actor,
  # 													player_names: @one_valid_name}
  # 		assert_redirected_to edit_game_path
  # 	  follow_redirect!
  # 	end
  # 	assert_select @movie.overview
  # 	assert_select @player.id
  # 	assert_select @player.name
  # 	patch game_path(session[:id]), players_guesses: { "player[1]" => "42"}
  # 	assert_response :success
  # 	get edit_game_path
  # end
end
