# :nodoc:
class Booking < ApplicationRecord
  has_many :reservations
  has_many :members, through: :reservations

  validates :reserved_at, presence: true

  scope :confirmed, -> { where(confirmed: true) }
  scope :pending, -> { where(confirmed: false) }
  scope :order_by_desc, -> { order('BOOKINGS.reserved_at DESC') }
  scope :reserved_after, ->(dt) { where('BOOKINGS.reserved_at >= ?', dt.at_beginning_of_day) }
  scope :reserved_before, ->(dt) { where('BOOKINGS.reserved_at <= ?', dt.at_end_of_day) }

  def self.this_week
    week_range = Date.today.all_week
    confirmed.reserved_after(week_range.first).reserved_before(week_range.last)
  end
end
