require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    @players_string = "Tom, Dick, Harry"
    @actor_string = "Al Pacino"
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create, session: { players: @players_string,
                                         actor: @actor_string }
    assert_redirected_to show_movie_path
  end

  test "should patch update" do
    players_guesses = Hash.new
    players_guesses["Tom"] = "42"

    post :create, session: { players: @players_string,
                                         actor: @actor_string }
    assert_redirected_to show_movie_path

    patch :update, players_guesses: players_guesses
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy
    assert_redirected_to new_session_path
  end

end
