class ListingCreation
  def create_listing(user_id, listing_params)
    @listing = Listing.new(listing_params)
    @listing.user_id = user_id
    # Get the entry for this user's specific resource
    @userResource = UserResource.find_by(user_id: user_id, resource_type_id: listing_params[:resource_type_id])
    # Ensure user has enough resources
    if @userResource.amount < listing_params[:quantity].to_i
      @listing.errors.add(:quantity, "too high")
      return @listing, false
    end
    if @listing.valid?
      @userResource.amount -= listing_params[:quantity].to_i
      @userResource.save
      @listing.save
      return @listing, true
    end
    return @listing, false
  end

  def destroy_listing(listing)
    # get listing

    # give resources back to associated user
    ## Get the entry for this user's specific resource
    # @userResource = UserResource.find_by(user_id: user_id, resource_type_id: listing_params[:resource_type_id])

    # TODO: Refactor this because it's so bad but it's the only way I can think about it
    amount_to_increase = listing.quantity
    resource_type_to_increase = listing.resource_type_id
    user_to_affect = listing.user
    actual_resource_object_to_affect = user_to_affect.user_resources.where(resource_type_id: resource_type_to_increase).first

    actual_resource_object_to_affect.amount += amount_to_increase
    actual_resource_object_to_affect.save
    # destroy listing
    listing.destroy!
  end
end
