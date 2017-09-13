class AlteringTimesAllowedToDateTimeInEventsAndAvailabilities < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :times_allowed
    add_column :events, :times_allowed, :datetime, array: true, default: []
    remove_column :availabilities, :times_available
    add_column :availabilities, :times_available, :datetime, array: true, default: []
  end
end
