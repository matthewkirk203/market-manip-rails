class DropResources < ActiveRecord::Migration[8.0]
  def change
      drop_table :resources do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
