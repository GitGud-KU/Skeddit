class CreateAvailability < ActiveRecord::Migration[5.1]
  def change
    create_table :availabilities do |t|
      t.serial :times_available
    end
  end
end
