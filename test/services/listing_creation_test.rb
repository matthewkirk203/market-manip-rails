require "test_helper"

class ListingsCreationTest < ActiveSupport::TestCase
  setup do
    # @listing = listings(:one)
    # login_as users(:one)
  end

  test "create listing with enough resources" do
    # login_as users(:one)
    # binding.pry
    @listing = listings(:one)
    listing, result = ListingCreation.new.create_listing(users(:one).id, { price: @listing.price, quantity: @listing.quantity, resource_type_id: @listing.resource_type_id } )
    # assert :success
    assert listing
    # Assert that it succeeded
    assert_equal true, result
    # Assert that the amount the user has went from 1 -> 0.
    # TODO: Generalize this so it doesn't have to be hardcoded to 0
    assert_equal users(:one).user_resources.where(resource_type_id: @listing.resource_type_id).pick(:amount), 0
  end

  test "create listing without enough resources" do
    @listing = listings(:two)
    listing, result = ListingCreation.new.create_listing(users(:one).id, { price: @listing.price, quantity: @listing.quantity, resource_type_id: @listing.resource_type_id } )
    # assert :success
    assert_equal false, result, "resources not correctly checked"
  end
end
