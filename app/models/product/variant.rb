class Product::Variant < ApplicationRecord

  # Constants:
  VARIANT_TYPES = { physical: "physical", digital: "digital" }.freeze

  # Enumerations:
  enum variant_type: VARIANT_TYPES

  # R/Ships:
  has_rich_text :description
  has_many_attached :images
  has_many_attached :downloads
  belongs_to :product
  has_many :inventories, class_name: "Product::Variant::Inventory", foreign_key: "product_variant_id", dependent: :destroy
  has_many :option_value_variants, class_name: "Product::OptionValueVariant", foreign_key: "product_variant_id", dependent: :destroy
end
