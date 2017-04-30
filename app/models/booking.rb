# Booking model is designed to be created by either a user
# or an admin (from the admin panel)
class Booking < ApplicationRecord
  belongs_to :offer

  validates :reserved_at, presence: true
  validates :week_number, presence: true

  scope :confirmed, -> { where(confirmed: true) }
  scope :pending, -> { where(confirmed: false) }
  scope :desc_order, -> { order('bookings.reserved_at DESC') }

  scope :by_year, ->(year) { where('extract(year from bookings.reserved_at) = ?', year) }
  scope :by_week, ->(week, year) { where(week_number: week).by_year(year) }

  before_validation on: :create do
    self.week_number = reserved_at&.strftime('%W')
  end
end
