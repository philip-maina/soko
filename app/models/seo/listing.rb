# == Schema Information
#
# Table name: seo_listings
#
#  id                :bigint           not null, primary key
#  seo_listable_id   :bigint
#  seo_listable_type :string
#  meta_title        :string           not null
#  meta_description  :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Seo::Listing < ApplicationRecord

  # Associations:
  belongs_to :seo_listable, polymorphic: true, inverse_of: :seo_listing

  # Validations:
  validates :meta_title, presence: true
end
