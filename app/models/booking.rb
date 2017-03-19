class Booking < ApplicationRecord
  has_many :reservations
  has_many :members, through: :reservations

  validates :reserved_at, presence: true

  scope :approved, -> { where(approved: true) }
  scope :not_approved, -> { where(approved: false) }
  scope :order_by_desc, -> { order('bookings.reserved_at DESC') }
end
