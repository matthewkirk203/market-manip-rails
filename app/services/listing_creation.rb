class ListingCreation
  def create_listing(listing_params)
    @listing = Listing.new(listing_params)
    # Get the entry for this user's specific resource
    @userResource = UserResource.find_by(user_id: Current.user.id, resource_type_id: listing_params[:resource_type_id])
    # Ensure user has enough resources
    if @userResource.amount < listing_params[:quantity].to_i
      return false
    end
    @userResource.amount -= listing_params[:quantity].to_i
    # binding.pry
    @userResource.save
    @listing.save
    @listing
  end
end
