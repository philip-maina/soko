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
class Product::Variant::PersonalizationField::TextField < Product::Variant::PersonalizationField
  def self.sti_name
    "text_field"
  end
end
