require 'test_helper'

class PodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:bjorn)
    #@pod = Pod.new(user_id:@user.id,name: "death box",description:"a box of death")
    @pod = @user.pods.build(name: "death box",description:"a box of death")
    #@pod = @user.pod.build(name: "death box",description:"a box of death")
  end
  test "should be valid" do
    assert @pod.valid?
  end

  test "user id should be present" do
    @pod.user_id = nil
    assert_not @pod.valid?
  end
end
