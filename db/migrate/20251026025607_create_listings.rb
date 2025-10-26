class CreateListings < ActiveRecord::Migration[8.0]
  def change
    create_table :listings do |t|
      t.string :resource_name
      t.integer :quantity
      t.integer :price
      t.string :owner

      t.timestamps
    end
  end
end
