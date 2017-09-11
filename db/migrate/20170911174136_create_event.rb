class CreateEvent < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.serial :times_allowed
      t.belongs_to :user #admin
    end
  end
end
