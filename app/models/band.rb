class Band < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :availabilities
  has_one_attached :photo
  validates :photo, :name, :genre, presence: true
end
