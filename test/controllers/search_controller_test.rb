require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get trending" do
    get :trending
    assert_response :success
  end

end
