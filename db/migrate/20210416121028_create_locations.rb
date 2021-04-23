class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.boolean :inventory, null: false, default: true
      t.boolean :local_pickup, null: false, default: false
      t.boolean :default, null: false
      t.integer :fulfillment_priority

      t.timestamps
    end
  end
end
