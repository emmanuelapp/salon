# :nodoc:
class BookingForm
  include ActiveModel::Model

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Booking')
  end

  attr_reader :booking
  attr_reader :offer_ids
  attr_reader :params

  delegate :first_name,      to: :booking
  delegate :last_name,       to: :booking
  delegate :phone,           to: :booking
  delegate :reserved_at,     to: :booking
  delegate :additional_info, to: :booking

  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :phone,           presence: true

  validates :offer_ids,       with: :order_ids?

  def initialize(params = ActiveSupport::HashWithIndifferentAccess.new)
    @params    = params
    @booking   = Booking.new(booking_params)

    @offer_ids = params.fetch(:booking, {})
                       .fetch(:offer_ids, {})
                       .reject { |param| param == '' }
  end

  def save
    return false unless booking.valid?
    return false unless valid?

    ActiveRecord::Base.transaction do
      booking.save!

      offer_ids.each do |offer_id|
        booking.reservations.create!(offer_id: offer_id)
      end
    end
  end

  private

  def order_ids?
    return false if offer_ids.any?

    errors.add(:offer_ids, 'array is empty')
  end

  def booking_params
    return ActiveSupport::HashWithIndifferentAccess.new if params.empty?

    params.require(:booking).permit(
      :first_name,
      :last_name,
      :phone,
      :confirmed,
      :additional_info,
      :reserved_at
    )
  end
end
