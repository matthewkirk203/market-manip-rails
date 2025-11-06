class ChangeResourceNameTypeForListings < ActiveRecord::Migration[8.0]
  def change
    # 1. Remove the old string column
    remove_column :listings, :resource_name, :string

    # 2. Add the new foreign key reference
    # This adds a `resource_type_id` column and indexes it.
    add_reference :listings, :resource_type, foreign_key: true
  end
end
