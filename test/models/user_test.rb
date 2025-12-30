require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get number of resource for user" do
    user = users(:one)
    assert_equal 1, user.get_user_resources_for_type(resource_types(:one).id).amount
  end

  test "number of resources should be zero" do
    user = users(:one)
    assert_equal 0, user.get_user_resources_for_type(nil).amount
  end
end
