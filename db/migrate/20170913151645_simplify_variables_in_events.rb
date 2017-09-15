class SimplifyVariablesInEvents < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :event_name, :name
    rename_column :events, :event_date, :date
  end
end
