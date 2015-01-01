require 'test_helper'
require 'pp'

class CreateSessionsTest < ActionDispatch::IntegrationTest

	def setup
	  @players_string = "Tom, Dick, Harry"
	  @actor_string = "Al Pacino"
	end

  test "create a session" do
  	post create_session_path, session: { players: @players_string,
  																			 actor: @actor_string }

    assert_redirected_to show_movie_path
    follow_redirect!
    assert session[:game_id]
    assert session[:players_names]

  end

  test "create a session and correctly update score" do
  	players_guesses = Hash.new
  	players_guesses["Tom"] = 42
  	players_guesses["Dick"] = 47
  	players_guesses["Harry"] = 23

  	post create_session_path, session: { players: @players_string,
  																			 actor: @actor_string }

    assert_redirected_to show_movie_path
    follow_redirect!

    patch score_update_path, players_guesses:  players_guesses
    assert_response :success

    assert session[:game_id]
    assert session[:players_names]


    assert_equal 50, session[:players_scores]["Tom"]
    assert_equal 45, session[:players_scores]["Dick"]
    assert_equal 69, session[:players_scores]["Harry"]

  end
end
