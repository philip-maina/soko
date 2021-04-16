class Product::Variant < ApplicationRecord

  # Constants:
  VARIANT_TYPES = { physical: "physical", digital: "digital" }.freeze

  # Enumerations:
  enum variant_type: VARIANT_TYPES

  # R/Ships:
  belongs_to :product
  has_rich_text :description
  has_many_attached :images
  has_many_attached :downloads
end
