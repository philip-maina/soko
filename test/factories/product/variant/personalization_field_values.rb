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
FactoryBot.define do
  factory :product_variant_personalization_field_value, class: 'Product::Variant::PersonalizationFieldValue' do
    product_variant_personalization_field { nil }
    value { "" }
  end
end
