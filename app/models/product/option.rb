# == Schema Information
#
# Table name: product_options
#
#  id          :bigint           not null, primary key
#  product_id  :bigint           not null
#  name        :string           not null
#  description :text
#  position    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product::Option < ApplicationRecord

  # Associations:
  belongs_to :product, inverse_of: :options
  has_many :option_values, class_name: "Product::OptionValue", foreign_key: "product_option_id", dependent: :destroy, inverse_of: :option

  # Validations:
  validates :name, :position, presence: true
  validates :name, uniqueness: { case_sensitive: false, if: :name?, scope: :product_id }
  validates :position, numericality: { greater_than_or_equal_to: 0, if: :position? }
end
