class DropListings < ActiveRecord::Migration[8.0]
  def change
    drop_table :listings
  end
end
