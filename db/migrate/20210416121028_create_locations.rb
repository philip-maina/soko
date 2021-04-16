class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.boolean :inventory
      t.boolean :local_pickup
      t.boolean :default
      t.integer :fulfillment_priority

      t.timestamps
    end
  end
end
