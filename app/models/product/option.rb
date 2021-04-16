class Product::Option < ApplicationRecord

  # R/Ships:
  belongs_to :product
  has_many :option_values, class_name: "Product::OptionValue", foreign_key: "product_option_id", dependent: :destroy
end
