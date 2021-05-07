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
FactoryBot.define do
  factory :seo_listing, class: 'Seo::Listing' do
    seo_listable_id { 1 }
    seo_listable_type { "MyString" }
    meta_title { "MyString" }
    meta_description { "MyText" }
  end
end
