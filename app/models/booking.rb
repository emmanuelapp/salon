# :nodoc:
class Booking < ApplicationRecord
  has_many :reservations
  has_many :members, through: :reservations

  validates :reserved_at, presence: true

  scope :confirmed, -> { where(confirmed: true) }
  scope :pending, -> { where(confirmed: false) }
  scope :order_by_desc, -> { order('bookings.reserved_at DESC') }

  scope :by_year, ->(year) { where('extract(year from bookings.reserved_at) = ?', year) }
  scope :by_week, ->(week, year) { where(week_number: week).by_year(year) }

  before_save :determine_week_number

  private

  def determine_week_number
    self.week_number = reserved_at.strftime('%W')
  end
end
