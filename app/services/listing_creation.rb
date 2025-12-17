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
end
