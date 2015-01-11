require 'test_helper'

class ActorEntryTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @existing_actor = "Al Pacino"
    @new_actor = "John Cazale"
    @invalid_actor = "Ermagehrd Goofbumpths"
  end

  test "Enter actor name already in db" do
  	assert_no_difference "Actor.count" do
  		post create_actor_path, :actor_name => @existing_actor
  	end
  	assert_response :success
  end

  test "Enter new actor name in db" do
  	assert_difference "Actor.count", 1 do
  		post create_actor_path, :actor_name => @new_actor
  	end
  	assert_response :success
  end

  test "Enter new name, then reenter same name" do
  	assert_difference "Actor.count", 1 do
  		post create_actor_path, :actor_name => @new_actor
  	end
  	assert_no_difference "Actor.count" do
  		post create_actor_path, :actor_name => @new_actor
  	end
  end

  test "redirect to root if non-existent name entered" do
    post create_actor_path, :actor_name => @invalid_actor
    assert_redirected_to new_actor_path
    assert_equal flash[:danger], "Actor does not exist. Try again."
  end
end
