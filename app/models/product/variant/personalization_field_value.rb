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

  # R/Ships:
  belongs_to :personalization_field, class_name: "Product::Variant::PersonalizationField", foreign_key: "product_variant_personalization_field_id"
  has_many_attached :files
end
