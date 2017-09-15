class Event < ApplicationRecord
  belongs_to :user #admin
  has_many :availabilities, dependent: :destroy
  has_many :participants, through: :availabilities, source: :user

  before_save :compact_times_allowed

  private

  def compact_times_allowed
    self.times_allowed = self.times_allowed.compact
  end
end
