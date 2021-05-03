# == Schema Information
#
# Table name: product_variants
#
#  id                    :bigint           not null, primary key
#  product_id            :bigint           not null
#  variant_type          :enum             default("physical"), not null
#  title                 :string           not null
#  subtitle              :string
#  sku                   :string           not null
#  master                :boolean          not null
#  search_tags           :text             default([]), is an Array
#  care_tags             :text             default([]), is an Array
#  visible_on_storefront :boolean          default(TRUE)
#  track_inventory       :boolean          default(TRUE)
#  backorderable         :boolean          default(TRUE)
#  giftable              :boolean          default(TRUE)
#  weight                :float
#  weight_unit           :enum
#  data                  :jsonb
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
FactoryBot.define do
  factory :product_variant, class: 'Product::Variant' do
    product { nil }
    title { "MyString" }
    subtitle { "MyString" }
    sku { "MyString" }
    master { false }
    search_tags { "MyText" }
    care_tags { "MyText" }
    visible_on_storefront { false }
    track_inventory { false }
    backorderable { false }
    giftable { false }
    data { "" }
  end
end
