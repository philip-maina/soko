# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  brand_id     :bigint
#  product_type :enum             default("standard"), not null
#  status       :enum             default("drafted"), not null
#  data         :jsonb
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Product < ApplicationRecord
  belongs_to :brand, optional: true
end
