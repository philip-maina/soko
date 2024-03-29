# == Schema Information
#
# Table name: collection_items
#
#  id                       :bigint           not null, primary key
#  collection_itemable_id   :bigint
#  collection_itemable_type :string
#  collection_id            :bigint           not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class Collection::Item < ApplicationRecord

  # Associations:
  belongs_to :collection, inverse_of: :items
  belongs_to :collection_itemable, polymorphic: true, inverse_of: :collection_items
end
