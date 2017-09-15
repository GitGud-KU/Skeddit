class Event < ApplicationRecord
  # Every event belongs to an 'admin' user, and has many availabilites and 'participants' (users)
  #   through its availabilities.
  # When an event is destroyed, so are all of its related availabilities.
  belongs_to :owner, class_name: :User, foreign_key: :user_id # admin user
  has_many :availabilities, dependent: :destroy
  has_many :participants, through: :availabilities, source: :user

  # Run compact_times_allowed method before saving an event to the database.
  before_save :compact_times_allowed

  private

  # Delete all nil values from times_allowed array using ruby's compact method.
  def compact_times_allowed
    self.times_allowed = self.times_allowed.compact
  end
end
