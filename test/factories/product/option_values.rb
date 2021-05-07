# == Schema Information
#
# Table name: product_option_values
#
#  id                :bigint           not null, primary key
#  product_option_id :bigint           not null
#  value             :string           not null
#  position          :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :product_option_value, class: 'Product::OptionValue' do
    product_option { nil }
    value { "MyString" }
    position { 1 }
  end
end
