# Represents a bookable offer which is available in the salon.
class Offer < ApplicationRecord
  belongs_to :member

  has_many :bookings

  validates :description, presence: true
  validates :name, presence: true

  def to_s
    "#{price} - #{name}"
  end
end
