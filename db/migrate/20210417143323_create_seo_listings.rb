class CreateSeoListings < ActiveRecord::Migration[6.1]
  def change
    create_table :seo_listings do |t|
      t.bigint :seo_listable_id
      t.string :seo_listable_type
      t.string :meta_title, null: false
      t.text :meta_description

      t.timestamps
    end

    add_index :seo_listings, %i[seo_listable_id seo_listable_type]
  end
end
