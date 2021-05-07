# == Schema Information
#
# Table name: product_option_value_variants
#
#  id                      :bigint           not null, primary key
#  product_option_value_id :bigint           not null
#  product_variant_id      :bigint           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
require "test_helper"

class Product::OptionValueVariantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
