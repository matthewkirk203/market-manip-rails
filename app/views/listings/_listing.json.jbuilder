json.extract! listing, :id, :resource_name, :quantity, :price, :owner, :created_at, :updated_at
json.url listing_url(listing, format: :json)
