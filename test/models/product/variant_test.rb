# == Schema Information
#
# Table name: product_variants
#
#  id                        :bigint           not null, primary key
#  product_id                :bigint           not null
#  variant_type              :enum             default("physical"), not null
#  title                     :string           not null
#  subtitle                  :string
#  sku                       :string           not null
#  master                    :boolean          not null
#  search_tags               :text             default([]), is an Array
#  care_tags                 :text             default([]), is an Array
#  visible_on_storefront     :boolean          default(TRUE)
#  track_inventory           :boolean          default(TRUE)
#  backorderable             :boolean          default(TRUE)
#  giftable                  :boolean          default(TRUE)
#  weight                    :float
#  weight_unit               :enum
#  data                      :jsonb
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  inventory_multiplier      :float            default(1.0), not null
#  inventory_multiplier_unit :enum             default("pcs"), not null
#
require "test_helper"

class Product::VariantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
