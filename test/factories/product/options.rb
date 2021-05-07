# == Schema Information
#
# Table name: product_options
#
#  id          :bigint           not null, primary key
#  product_id  :bigint           not null
#  name        :string           not null
#  description :text
#  position    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :product_option, class: 'Product::Option' do
    product { nil }
    name { "MyString" }
    description { "MyText" }
    position { 1 }
  end
end
