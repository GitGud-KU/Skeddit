#Ensures the availability meets all the requirements before being added.
#Because of the way we set up our database, User and Event ids are already validated elsewhere.
class AvailabilityValidator < ActiveModel::Validator
	def validate(availability)
		#Make sure at least one available time is selected.
		if availability.times_available.size <= 0
			availability.errors[:base] << "Must choose at least one time slot"
		end
	end
end

class Availability < ApplicationRecord
  # Each Availablity 'belongs to' an event and a user.
  # If an availability's user or event is destroyed, so is the availability. 
  belongs_to :event
  belongs_to :user

  #Ensures the availability meets all the requirements before being added.
  validates_with AvailabilityValidator
end

