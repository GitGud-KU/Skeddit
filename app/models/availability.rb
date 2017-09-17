#Ensures the availability meets all the requirements before being added.
class AvailabilityValidator < ActiveModel::Validator
	def validate(availability)
		#Check for valid event id.
		if availability.event_id == nil || availability.event_id < 1
			availability.errors[:base] << "Must have a valid event id"
		end
		#Check for valid user id.
		if availability.user_id == nil || availability.user_id < 1
			availability.errors[:base] << "Must have a valid uesr id"
		end
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
