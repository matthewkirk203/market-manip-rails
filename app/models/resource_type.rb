class ResourceType < ApplicationRecord
  has_many :user_resources
  has_many :users, through: :user_resources
  has_many :listings
end
