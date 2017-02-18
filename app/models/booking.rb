class Booking < ApplicationRecord
  has_many :reservations
  has_many :members, through: :reservations

  validates :reserved_at, presence: true
  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :phone,       presence: true
end
