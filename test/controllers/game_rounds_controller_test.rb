require 'test_helper'

class GameRoundsControllerTest < ActionController::TestCase
  test "should get new_game" do
    get :update
    assert_response :success
  end
end
