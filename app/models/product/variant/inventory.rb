class Product::Variant::Inventory < ApplicationRecord

  # R/Ships:
  belongs_to :location
  belongs_to :variant, class_name: "Product::Variant", foreign_key: "product_variant_id"
end
