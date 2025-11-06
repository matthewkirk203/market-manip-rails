class UserResource < ApplicationRecord
  belongs_to :user
  belongs_to :resource_type

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, uniqueness: { scope: :resource_type_id }
end
