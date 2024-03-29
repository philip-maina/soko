# == Schema Information
#
# Table name: brands
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Brand < ApplicationRecord

  # Associations:
  has_rich_text :description
  has_many :products, dependent: :nullify, inverse_of: :brand

  # Validations:
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
