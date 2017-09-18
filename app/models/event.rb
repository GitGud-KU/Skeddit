class Event < ApplicationRecord
  # Every event belongs to an 'admin' user, and has many availabilites and 'participants' (users)
  #   through its availabilities.
  # When an event is destroyed, so are all of its related availabilities.
  belongs_to :owner, class_name: :User, foreign_key: :user_id # admin user
  has_many :availabilities, dependent: :destroy
  has_many :participants, through: :availabilities, source: :user

  # Run compact_times_allowed method before saving an event to the database.
  before_save :compact_times_allowed
  before_save :ensure_times_allowed_has_correct_date

  # Ensures data is in an allowable format before adding it to the database
  validate :name_cannot_be_empty, :must_choose_at_least_one_time, :date_cannot_be_in_the_past
  
  POSSIBLE_TIMES_CONST = Array.new(48).map.with_index{|x,index| Date.today.to_datetime + index * (1.0/48)}

  private

  # Delete all nil values from times_allowed array using ruby's compact method.
  def compact_times_allowed
    self.times_allowed = self.times_allowed.compact
  end
  
  #Ensures the name field is not empty
  def name_cannot_be_empty
    if self.name == ""
      self.errors[:base] << "Name cannot be empty"
    end
  end
  
  #Ensures that at least one time is chosen for the event
  def must_choose_at_least_one_time
    self.times_allowed = self.times_allowed.compact
    if self.times_allowed.size <= 0
      self.errors[:base] << "Must choose at least one time slot"
    end
  end
  
  #Verifies event date is not before today
  def date_cannot_be_in_the_past
    if self.date < Date.today
      self.errors[:base] << "Cannot choose a date in the past"
    end
  end

  #When we created the times, we used today to generate the intervals. 
  #This changes the date of the datetime to the event date.
  def ensure_times_allowed_has_correct_date
    self.times_allowed = self.times_allowed.map{|time| time.change(:year => self.date.year,
                                              :month => self.date.month,
                                              :day => self.date.day)}
  end
end
