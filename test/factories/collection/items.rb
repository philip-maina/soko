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
FactoryBot.define do
  factory :collection_item, class: 'Collection::Item' do
    collection_itemable_id { "" }
    collection_itemable_type { "MyString" }
    collection { nil }
  end
end
