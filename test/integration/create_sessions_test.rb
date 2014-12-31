require 'test_helper'

class CreateSessionsTest < ActionDispatch::IntegrationTest

	def setup
	  @players_string = "Tom, Dick, Harry"
	  @actor_string = "Al Pacino"
	end

  test "create a session with players and actor" do
  	post create_session_path, session: { players: @players_string,
  																			 actor: @actor_string }

    assert_redirected_to show_movie_path
    follow_redirect!
    assert session[:game_id]
  end
end
