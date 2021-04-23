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

  # R/Ships:
  belongs_to :product
  has_many :option_values, class_name: "Product::OptionValue", dependent: :destroy
end
