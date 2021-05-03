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
  
  # Virtual Attributes:
  attr_accessor :temporary_id

  # R/Ships:
  belongs_to :option, class_name: "Product::Option", foreign_key: "product_option_id"
  has_many :option_value_variants, class_name: "Product::OptionValueVariant", foreign_key: "product_option_value_id", dependent: :destroy

  # Validations:
  validates :value, :position, presence: true
  validates :value, uniqueness: { case_sensitive: false, if: :value?, scope: :product_option_id }
  validates :position, numericality: { greater_than_or_equal_to: 0, if: :position? }
end
