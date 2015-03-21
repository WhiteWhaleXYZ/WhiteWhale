require 'test_helper'

class PodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:bjorn)
    @pod = @user.pod.build(name: "death box",description:"a box of death")
  end
  test "should be valid" do
    assert @pod.valid?
  end
end
