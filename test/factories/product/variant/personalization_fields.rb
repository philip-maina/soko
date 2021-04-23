# == Schema Information
#
# Table name: product_variant_personalization_fields
#
#  id                 :bigint           not null, primary key
#  product_variant_id :bigint           not null
#  label              :string           not null
#  help_text          :text
#  placeholder        :string
#  required           :boolean          default(TRUE), not null
#  position           :integer          default(0), not null
#  field_type         :enum             default("text_field"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :product_variant_personalization_field, class: 'Product::Variant::PersonalizationField' do
    product_variant { nil }
    label { "MyString" }
    help_text { "MyText" }
    placeholder { "MyString" }
    required { false }
    position { 1 }
  end
end
