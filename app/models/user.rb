class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :user_resources, dependent: :destroy
  has_many :resource_types, through: :user_resources

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  enum :role, { basic: 0, admin: 1 }

  def get_user_resources_for_type(resource_type_id)
    user_resources.find_or_initialize_by(resource_type_id: resource_type_id) do |res|
      res.amount = 0
    end
  end
end
