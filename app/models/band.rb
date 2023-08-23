class Band < ApplicationRecord
  belongs_to :user
  # has_many :bookings, :availabilities
end
