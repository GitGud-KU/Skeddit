class User < ApplicationRecord
  has_many :availablities
  has_many :events, through: :availabilities
end
