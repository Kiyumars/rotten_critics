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

  test "Enter actor name already in db" do
    assert_no_difference "Actor.count" do
      post games_path, { actor_name: @existing_actor,
                         players: @one_valid_name }

    end
  end

  test "fixture databases" do
    assert_equal actors(:Pacino).movies.count, games(:first_game).movies.count
  end

  test "create a game session" do
  	get new_game_path
  	assert_response :success
  	assert_difference ["Game.count", "Player.count"], 1 do
  		post games_path, { actor_name: @existing_actor,
  													players: @one_valid_name }
      follow_redirect!
  	end

    assert_template 'edit'
    assert_select "form input"
  end
end
