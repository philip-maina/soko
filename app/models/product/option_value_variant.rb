# == Schema Information
#
# Table name: product_option_value_variants
#
#  id                      :bigint           not null, primary key
#  product_option_value_id :bigint           not null
#  product_variant_id      :bigint           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class Product::OptionValueVariant < ApplicationRecord

  # Associations:
  belongs_to :option_value, class_name: "Product::OptionValue", foreign_key: "product_option_value_id", inverse_of: :option_value_variants
  belongs_to :variant, class_name: "Product::Variant", foreign_key: "product_variant_id", inverse_of: :option_value_variants
end
