require 'test_helper'

class ActorsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post actor name to create" do
    post :create, actor_name: "Al Pacino"
    assert_redirected_to show_actor_path
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy
    assert_response :success
  end

end
