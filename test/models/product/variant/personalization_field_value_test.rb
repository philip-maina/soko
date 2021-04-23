# == Schema Information
#
# Table name: product_variant_personalization_field_values
#
#  id                                       :bigint           not null, primary key
#  product_variant_personalization_field_id :bigint           not null
#  value                                    :jsonb
#  created_at                               :datetime         not null
#  updated_at                               :datetime         not null
#
require "test_helper"

class Product::Variant::PersonalizationFieldValueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
