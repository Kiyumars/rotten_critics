require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
	def setup
		@first_game = games(:first_game)
		@existing_actor = actors(:Pacino)
	end

  test "get movie in game round" do
  	get edit_game_movie_path(@first_game.id, movies(:Heat).id)
  	assert_response :success
  end
end
