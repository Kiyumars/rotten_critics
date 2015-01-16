require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
   def setup
  	@valid_player_names = ["Larry", "Curly", "Moe"]
  	@invalid_player_names = ["7", "7_2", "??%^$"]
  	@blank_name = ""
  	@one_blank_name = "Larry,,Curly"
  	@one_invalid_name = "Larry, 42, Moe"
  	@one_duplicate_name = "Larry, Curly, Moe, Larry"
  end

  test "should enter all valid_player_names" do
  	assert_difference 'Player.count', 3 do
  		@valid_player_names.each do |valid_player_name|
  			player = Player.new(:name => valid_player_name)
  			player.save
  		end
  	end
  end

  test "should not enter invalid_player_names" do
  	assert_no_difference "Player.count" do
  		@invalid_player_names.each do |invalid_player_name|
  			player = Player.new(:name => invalid_player_name)
  			player.save
  		end
  	end
  end

  test "should not enter blank_name into Player model" do
  	assert_no_difference "Player.count" do
  		player = Player.new(:name => @blank_name)
  		player.save
  	end
  end
end
