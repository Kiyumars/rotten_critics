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

  # test "what is the game id?" do
  #   assert_difference "Game.last.id", 1 do
  #     post games_path, { actor_name: @existing_actor,
  #                           players: @one_valid_name }
  #   end
  # end

  test "succesfully play one round with existing actor name" do
  	get new_game_path
  	assert_response :success
  	assert_difference ["Game.count", "Player.count"], 1 do
  		post games_path, { actor_name: @existing_actor,
  													players: @one_valid_name }
  		# assert_redirected_to edit_game_path
      # follow_redirect!
  	end
  	# assert_select @movie.overview
  	# assert_select @player.id
  	# assert_select @player.name
  	patch game_movie_path("2", "11162")
    assert_response :success
  	get edit_game_path
  end

end
