class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :resource_type

  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than: 0 }
end
