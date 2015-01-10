require 'test_helper'

class ActorEntryTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "Enter actor name already in db" do
  	assert_no_difference "Actor.count" do
  		post create_actor_path, :actor_name => "Al Pacino"
  	end
  	assert_response :success
  end

  test "Enter new actor name in db" do
  	assert_difference "Actor.count", 1 do
  		post create_actor_path, :actor_name => "Nicolas Cage"
  	end
  	assert_response :success
  end
end
