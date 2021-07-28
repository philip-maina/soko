class CreateProductVariants < ActiveRecord::Migration[6.1]
  def change
    create_enum :product_variant_type, %w[physical digital]
    create_enum :weight_unit_of_measure, %w[g kg lb oz]

    create_table :product_variants do |t|
      t.references :product, null: false, foreign_key: true
      t.enum :variant_type, enum_name: :product_variant_type, null: false, default: "physical"
      t.string :title, null: false
      t.string :subtitle
      t.string :sku, null: false
      t.boolean :master, null: false
      t.text :search_tags, array: true, default: []
      t.text :care_tags, array: true, default: []
      t.boolean :visible_on_storefront, default: true
      t.boolean :track_inventory, default: true
      t.boolean :backorderable, default: true
      t.boolean :giftable, default: true
      t.float :weight
      t.enum :weight_unit, enum_name: :weight_unit_of_measure
      t.jsonb :data, default: {}

      t.timestamps
    end
  end
end
