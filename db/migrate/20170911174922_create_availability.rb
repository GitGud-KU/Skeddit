class CreateAvailability < ActiveRecord::Migration[5.1]
  def change
    create_table :availabilities do |t|
      t.serial :times_available
      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
