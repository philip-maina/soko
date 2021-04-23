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
FactoryBot.define do
  factory :product_option_value_variant, class: 'Product::OptionValueVariant' do
    product_option_value { nil }
    product_variant { nil }
  end
end
