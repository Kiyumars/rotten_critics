require 'test_helper'

class GameRoundsControllerTest < ActionController::TestCase

	def setup
		players = ["Larry, Curly, Moe"]
	end

  test "should get new_game" do
    get :new
    assert_response :success
  end

  test "should get create" do
  	post :create, :players => "Larry, Curly, Moe"
  	assert_not(assert_redirected_to new_game_path)
  	assert_redirected_to allplayers_path
  end

  test "should get show" do
    get :show
    assert_response :success
  end
end
