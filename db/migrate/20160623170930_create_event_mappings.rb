class CreateEventMappings < ActiveRecord::Migration
  def change
    create_table :event_mappings do |t|
      t.references :user
      t.references :event
      t.timestamps
    end
  end
end
