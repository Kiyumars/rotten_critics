require 'test_helper'

class PlayersDbEntryTest < ActionDispatch::IntegrationTest
  def setup
  	@valid_player_names = "Larry, Curly, Moe"
  	@invalid_player_names = "7, 7_2, ??%^$"
  	@blank_name = ""
  	@one_blank_name = "Larry,,Curly"
  	@one_invalid_name = "Larry, 42, Moe"
  	@one_duplicate_name = "Larry, Curly, Moe, Larry"
  end

  test "should enter all valid_player_names into Player model" do
  	assert_difference 'Player.count', 3 do
  		post players_path, :players => @valid_player_names
  	end
  end

  test "should not enter invalid_player_names into Player model" do
  	assert_no_difference "Player.count" do
  		post players_path, :players => @invalid_player_names
  	end
  end

  test "should not enter blank_name into Player model" do
  	assert_no_difference "Player.count" do
  		post players_path, :players => @blank_name
  	end
  end

  test "should enter only valid names, ignore blanks" do
  	assert_difference "Player.count", 2 do
  		post players_path, :players => @one_blank_name
  	end
  end

  test "should redirect to new_game_path if player name is blank" do
  	post players_path, :players => @blank_name
  	assert_redirected_to new_game_path
  end

  test "should enter only valid names, ignore invalid names" do
  	assert_difference "Player.count", 2 do
  		post players_path, :players => @one_invalid_name
  	end
  end

  test "should not enter a duplicate name" do
  	assert_difference "Player.count", 3 do
  		post players_path, :players => @one_duplicate_name
  	end
  end
end
