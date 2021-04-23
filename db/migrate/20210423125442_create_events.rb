class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.bigint :eventable_id
      t.string :eventable_type
      t.bigint :creator_id
      t.string :creator_type
      t.string :name
      t.jsonb :data
      t.jsonb :request_details
      t.jsonb :metadata

      t.timestamps
    end

    add_index :events, %i[eventable_id eventable_type]
    add_index :events, %i[creator_id creator_type]
  end
end
