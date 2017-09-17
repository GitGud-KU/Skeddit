class EventValidator < ActiveModel::Validator

  def validate(event)
    #Remove all nils from time_allowed array
    event.times_allowed = event.times_allowed.compact
    #Check if event name is given
    if event.name == ""
      event.errors[:base] << "Name cannot be empty"
    end
    #Check to see if at least one time is chosen
    if event.times_allowed.size <= 0
      event.errors[:base] << "Must choose at least one time slot"
    end
    #Ensure date is not in the past
    if event.date < Date.today
      event.errors[:base] << "Cannot choose a date in the past"
    end
  end
end

class Event < ApplicationRecord
  # Every event belongs to an 'admin' user, and has many availabilites and 'participants' (users)
  #   through its availabilities.
  # When an event is destroyed, so are all of its related availabilities.
  belongs_to :owner, class_name: :User, foreign_key: :user_id # admin user
  has_many :availabilities, dependent: :destroy
  has_many :participants, through: :availabilities, source: :user

  # Run compact_times_allowed method before saving an event to the database.
  before_save :compact_times_allowed

  # Ensures data is in an allowable format before adding it to the database
  validates_with EventValidator

  POSSIBLE_TIMES_CONST = Array.new(48).map.with_index{|x,index| Date.today.to_datetime + index * (1.0/48)}

  private

  # Delete all nil values from times_allowed array using ruby's compact method.
  def compact_times_allowed
    self.times_allowed = self.times_allowed.compact
  end


end
