class Reservation < ApplicationRecord
  belongs_to :booking
  belongs_to :member
end
