require 'test_helper'

class UserPagesControllerTest < ActionController::TestCase

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
