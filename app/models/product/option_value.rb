# == Schema Information
#
# Table name: product_option_values
#
#  id                :bigint           not null, primary key
#  product_option_id :bigint           not null
#  value             :string           not null
#  position          :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Product::OptionValue < ApplicationRecord

  # R/Ships:
  belongs_to :option, class_name: "Product::Option", foreign_key: "product_option_id"
  has_many :option_value_variants, class_name: "Product::OptionValueVariant", dependent: :destroy
end
