class Booking < ApplicationRecord
  has_many :reservations
  has_many :members, through: :reservations

  validates :first_name, presence: true
end
