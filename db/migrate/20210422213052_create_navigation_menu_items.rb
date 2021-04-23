class CreateNavigationMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :navigation_menu_items do |t|
      t.bigint :navigation_menu_itemable_id
      t.string :navigation_menu_itemable_type
      t.string :name, null: false
      t.text :path, null: false
      t.text :url
      t.integer :sibling_position, null: false, default: 0
      t.boolean :visible, null: false, default: true

      t.timestamps
    end

    add_index :navigation_menu_items, %i[navigation_menu_itemable_id navigation_menu_itemable_type], name: "index_menu_items_on_menu_itemable_id_and_menu_itemable_type"
  end
end
