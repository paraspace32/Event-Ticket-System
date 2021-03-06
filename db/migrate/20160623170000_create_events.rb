class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :event_type
      t.date :begin_date
      t.date :end_date
      t.integer	:registration_cost
      t.date :registration_open_date
      t.date :registration_close_date
      t.timestamps
    end
  end
end
