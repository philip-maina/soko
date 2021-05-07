class CreateCollectionItems < ActiveRecord::Migration[6.1]
  def change
    create_table :collection_items do |t|
      t.bigint :collection_itemable_id
      t.string :collection_itemable_type
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end

    add_index :collection_items, %i[collection_itemable_id collection_itemable_type], name: "index_collection_items_on_itemable_id_and_itemable_type"
  end
end
