class Availability < ApplicationRecord
  # Each Availablity 'belongs to' an event and a user.
  # If an availability's user or event is destroyed, so is the availability. 
  belongs_to :event
  belongs_to :user
end
