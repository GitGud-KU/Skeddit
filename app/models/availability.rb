class Availability < ApplicationRecord
  # Each Availablity 'belongs to' an event and a user.
  # If an availability's user or event is destroyed, so is the availability.
  belongs_to :event
  belongs_to :user

  # Run compact_times_allowed method before saving an availability to the database.
  before_save :compact_times_allowed

  #Ensures the availability meets all the requirements before being added.
  #Because of the way we set up our databse, User and Event ids are already validated elsewhere.
  validate :must_choose_at_least_one_time

  private

  #Make sure at least one available time is selected.
  def must_choose_at_least_one_time
	self.times_available = self.times_available.compact
	if availability.times_available.size <= 0
		availability.errors[:base] << "Must choose at least one time slot"
	end
  end
	
  # Delete all nil values from times_available array using ruby's compact method.
  def compact_times_allowed
    self.times_available = self.times_available.compact
  end

end
