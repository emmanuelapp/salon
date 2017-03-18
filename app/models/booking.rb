class Booking < ApplicationRecord
  has_many :reservations
  has_many :members, through: :reservations

  validates :reserved_at, presence: true
end
