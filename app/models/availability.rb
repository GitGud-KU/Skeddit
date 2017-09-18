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

  # Make sure at least one available time is selected.
  # PRE: times_available exists
  # POST: if times_available is empty, add an error to errors hash
  def must_choose_at_least_one_time
  	if compact_times_available.size <= 0
  		self.errors[:base] << "Must choose at least one time slot"
  	end
  end
	
  # Delete all nil values from times_available array using ruby's compact method.
  # PRE: times_available exists
  # POST: remove nil values from times_available array
  def compact_times_available
    self.times_available = self.times_available.compact
  end

end
