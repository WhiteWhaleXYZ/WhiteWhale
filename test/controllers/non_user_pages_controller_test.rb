require 'test_helper'

class NonUserPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get privacy" do
    get :privacy
    assert_response :success
  end

  test "should get terms" do
    get :terms
    assert_response :success
  end

  test "should get advertise" do
    get :advertise
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get support" do
    get :support
    assert_response :success
  end

  test "should get 404" do
    get :404
    assert_response :success
  end

end
