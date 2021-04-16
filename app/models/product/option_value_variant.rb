class Product::OptionValueVariant < ApplicationRecord

  # R/Ships:
  belongs_to :option_value, class_name: "Product::OptionValue", foreign_key: "product_option_value_id"
  belongs_to :variant, class_name: "Product::Variant", foreign_key: "product_variant_id"
end
