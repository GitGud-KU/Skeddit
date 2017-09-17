class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # User can have many events and availabilities.
  # If a user is destroyed, all of their events and availabilities are destroyed as well.
  has_many :events, dependent: :destroy
  has_many :availabilities, dependent: :destroy

  def is_available_at_event_and_time?(event,time)
    self.availabilities.find_by(event_id: event.id).times_available.include?(time)
  end
end
