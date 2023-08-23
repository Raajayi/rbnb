class Band < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :availabilities
end
