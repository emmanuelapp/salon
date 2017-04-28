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

  validate :offer_ids do |record|
    record.errors.add(:offer_ids, 'array is empty') if record.offer_ids.empty?
  end

  def initialize(params = ActionController::Parameters.new)
    @params    = params
    @booking   = Booking.new(booking_params)

    @offer_ids = params.fetch(:booking, {})
                       .fetch(:offer_ids, {})
                       .reject { |param| param == '' }
  end

  def save
    return false unless valid?
    return false unless booking.valid?

    persist
  end

  private

  def persist
    ActiveRecord::Base.transaction do
      booking.save!

      offer_ids.each do |offer_id|
        booking.reservations.create!(offer_id: offer_id)
      end
    end
  end

  def booking_params
    return ActionController::Parameters.new if params.empty?

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
