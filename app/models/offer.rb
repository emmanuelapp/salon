class Offer < ApplicationRecord
  belongs_to :member

  has_many :reservations
  has_many :bookings, through: :reservations

  validates :description, presence: true
  validates :name, presence: true

  def to_s
    "#{price} - #{name}"
  end
end
