# == Schema Information
#
# Table name: brands
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Brand < ApplicationRecord

  # R/Ships:
  has_many :products, dependent: :nullify
  has_rich_text :description
end
