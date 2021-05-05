# == Schema Information
#
# Table name: product_variant_personalization_fields
#
#  id                 :bigint           not null, primary key
#  product_variant_id :bigint           not null
#  label              :string           not null
#  help_text          :text
#  placeholder        :string
#  options            :text             default([]), is an Array
#  required           :boolean          default(TRUE), not null
#  position           :integer          default(0), not null
#  field_type         :enum             default("text_field"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Product::Variant::PersonalizationField < ApplicationRecord

  # Included Modules:
  include CustomStiName

  # Constants:
  FIELD_TYPES = { 
    text_field: "text_field", 
    text_area: "text_area",
    number_field: "number_field",
    date_field: "date_field",
    file_field: "file_field",
    select_field: "select_field",
    multi_select_field: "multi_select_field" 
  }.freeze

  # Enumerations:
  enum field_type: FIELD_TYPES

  # Associations:
  belongs_to :variant, class_name: "Product::Variant", foreign_key: "product_variant_id"
  has_many :personalization_field_values, class_name: "Product::Variant::PersonalizationFieldValue", foreign_key: "product_variant_personalization_field_id", dependent: :nullify

  # Validations:
  validates :label, :field_type, :position, presence: true
  validates :field_type, inclusion: { in: FIELD_TYPES.values, if: :field_type? }
  validates :label, uniqueness: { case_sensitive: false, if: :label?, scope: :product_variant_id }
  validates :required, inclusion: { in: [ true, false ] }
  validates :position, numericality: { greater_than_or_equal_to: 0, if: :position? }


  # STI setup:
  self.inheritance_column = :field_type
end
