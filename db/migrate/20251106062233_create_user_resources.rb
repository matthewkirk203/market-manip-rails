class CreateUserResources < ActiveRecord::Migration[8.0]
  def change
    create_table :user_resources do |t|
      t.references :user, null: false, foreign_key: true
      t.references :resource_type, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end

  # This ensures a user can only have one entry per resource_type.
  add_index :user_resources, [:user_id, :resource_type_id], unique: true
  end
end
