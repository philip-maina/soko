class Product::OptionValueVariant < ApplicationRecord

  # R/Ships:
  belongs_to :product_option_value
  belongs_to :product_variant
end
