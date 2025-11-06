class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :user_resources, dependent: :destroy
  has_many :resource_types, through: :user_resources

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
