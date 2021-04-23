class CreateProductVariantPersonalizationFieldValues < ActiveRecord::Migration[6.1]
  def change
    create_table :product_variant_personalization_field_values do |t|
      t.references :product_variant_personalization_field, null: false, foreign_key: true, index: { name: "idx_variant_personalization_field_values_personalization_field" }
      t.jsonb :value

      t.timestamps
    end
  end
end
