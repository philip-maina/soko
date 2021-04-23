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
class Product::Variant::PersonalizationField < ApplicationRecord

  # Constants:
  FIELD_TYPES = { 
    text_field: "text_field", 
    text_area: "text_area",
    number_field: "number_field",
    date_field: "date_field",
    file_field: "file_field" 
  }.freeze

  # Enumerations:
  enum field_type: FIELD_TYPES

  # STI setup:
  self.inheritance_column = :field_type

  # R/Ships:
  belongs_to :variant, class_name: "Product::Variant", foreign_key: "product_variant_id"
  has_many :personalization_field_values, class_name: "Product::Variant::PersonalizationFieldValue", dependent: :nullify
end
