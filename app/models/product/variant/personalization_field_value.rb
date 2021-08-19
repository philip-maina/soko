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
class Product::Variant::PersonalizationFieldValue < ApplicationRecord

  # Associations:
  belongs_to :personalization_field, class_name: "Product::Variant::PersonalizationField", foreign_key: "product_variant_personalization_field_id", inverse_of: :personalization_field_values
  has_many_attached :files
end
