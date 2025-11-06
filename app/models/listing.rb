class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :resource_type
end
