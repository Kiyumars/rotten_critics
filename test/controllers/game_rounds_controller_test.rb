require 'test_helper'

class GameRoundsControllerTest < ActionController::TestCase
  test "should get new_game" do
    get :new
    assert_response :success
  end

  test "should get next_round" do
    get :update
    assert_response :success
  end
end
