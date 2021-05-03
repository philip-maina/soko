class CreateProductVariantPersonalizationFields < ActiveRecord::Migration[6.1]
  def change
    create_enum :field_type, %w[text_field text_area number_field date_field file_field select_field multi_select_field]

    create_table :product_variant_personalization_fields do |t|
      t.references :product_variant, null: false, foreign_key: true, index: { name: "idx_variant_personalization_fields_on_variant_id" }
      t.string :label, null: false
      t.text :help_text
      t.string :placeholder
      t.text :options, array: true, default: []
      t.boolean :required, null: false, default: true
      t.integer :position, null: false, default: 0
      t.enum :field_type, enum_name: :field_type, null: false, default: "text_field"

      t.timestamps
    end
  end
end
