class Product::OptionValue < ApplicationRecord

  # R/Ships:
  belongs_to :product_option
  has_many :option_value_variants, class_name: "Product::OptionValueVariant", foreign_key: "product_option_value_id", dependent: :destroy
end
