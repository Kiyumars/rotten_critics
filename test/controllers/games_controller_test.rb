require 'test_helper'

class GamesControllerTest < ActionController::TestCase
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

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect to new_game_path if player name is blank" do
    post :create, :players => @blank_name, :actor_name => @one_valid_name
    assert_redirected_to new_game_path
  end

  test "should redirect if actor does not exist" do
    post :create, :players => @valid_player_names, :actor_name => @invalid_actor
    assert_redirected_to new_game_path
  end

  test "Enter new actor, then reenter same actor" do
    assert_difference "Actor.count", 1 do
      post :create, :players => @valid_player_names, :actor_name => @new_actor
    end
    assert_no_difference "Actor.count" do
      post :create, :players => @valid_player_names, :actor_name => @new_actor
    end
  end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
