class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_enum :collection_status, %w[drafted published archived]
    create_enum :collection_type, %w[manual automated]

    create_table :collections do |t|
      t.string :name, null: false
      t.enum :status, enum_name: :collection_status, null: false, default: "drafted"
      t.enum :collection_type, enum_name: :collection_type, null: false, default: "manual"

      t.timestamps
    end
  end
end
