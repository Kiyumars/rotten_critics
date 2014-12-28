require 'test_helper'

class GameRoundsControllerTest < ActionController::TestCase
  test "should get new_game" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end
end
