require 'test_helper'

class UserPagesControllerTest < ActionController::TestCase
  test "should get collections" do
    get :collections
    assert_response :success
  end

  test "should get sets" do
    get :sets
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get followlist" do
    get :followlist
    assert_response :success
  end

  test "should get wishlist" do
    get :wishlist
    assert_response :success
  end

  test "should get rank" do
    get :rank
    assert_response :success
  end

end
