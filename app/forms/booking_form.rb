# :nodoc:
class BookingForm
  include ActiveModel::Model

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Booking')
  end

  attr_reader :booking

  delegate :first_name,      to: :booking
  delegate :last_name,       to: :booking
  delegate :phone,           to: :booking
  delegate :reserved_at,     to: :booking
  delegate :additional_info, to: :booking

  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :phone,           presence: true
  validates :additional_info, presence: true

  def initialize(attributes = {})
    @booking = Booking.new(attributes)
  end

  def save
    @booking.valid? && valid? ? @booking.save : false
  end
end
