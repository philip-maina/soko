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
class Product::Variant::PersonalizationField::FileField < Product::Variant::PersonalizationField
  def self.sti_name
    "file_field"
  end
end
