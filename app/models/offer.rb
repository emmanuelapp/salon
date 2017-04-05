class Offer < ApplicationRecord
  has_many :reservations
  has_many :bookings, through: :reservations

  def to_s
    "#{price} - #{name}"
  end
end
