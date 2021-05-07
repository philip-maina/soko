# == Schema Information
#
# Table name: collections
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  status          :enum             default("drafted"), not null
#  collection_type :enum             default("manual"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Collection < ApplicationRecord

  # Constants:
  STATUSES         = { drafted: "drafted", published: "published", archived: "archived" }.freeze
  COLLECTION_TYPES = { manual: "manual", automated: "automated" }.freeze

  # Enumerations:
  enum status: STATUSES
  enum collection_type: COLLECTION_TYPES

  # Associations:
  has_rich_text :description
  has_one_attached :background_image
  has_one :seo_listing, as: :seo_listable, class_name: "Seo::Listing", dependent: :destroy
  has_many :navigation_menu_items, as: :navigation_menu_itemable, class_name: "Navigation::MenuItem", dependent: :destroy
  has_many :items, class_name: "Collection::Item", dependent: :destroy

  # Validations:
  validates :name, :collection_type, :status, presence: true
  validates :name, uniqueness: { case_sensitive: false, if: :name? }
  validates :status, inclusion: { in: STATUSES.values, if: :status? }
  validates :collection_type, inclusion: { in: COLLECTION_TYPES.values, if: :collection_type? }
end
