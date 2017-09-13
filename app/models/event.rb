class Event < ApplicationRecord
  belongs_to :user #admin
  has_many :availabilities
  has_many :participants, through: :availabilities, source: :user
end
