require 'test_helper'

class PlayersDbEntryTest < ActionDispatch::IntegrationTest
  def setup
  	@valid_player_names = "Larry, Curly, Moe"
  	@invalid_player_names = "7, 7_2, ??%^$"
  end

  test "should enter valid_player_names into Player model" do
  	assert_difference 'Player.count', 3 do
  		post players_path, :players => @valid_player_names
  	end
  end

  test "should not enter invalid_player_names into Player model" do
  	assert_no_difference "Player.count" do
  		post players_path, :players => @invalid_player_names
  	end
  end
end
