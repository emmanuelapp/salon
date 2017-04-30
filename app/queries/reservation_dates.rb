module Queries
  # Determines the available reservation hours
  class ReservationDates
    attr_reader :date, :offer, :member

    def self.all
      new.all
    end

    def initialize(offer_id, date = Date.today)
      @offer  = Offer.find_by(id: offer_id)
      @member = @offer.member
      @date   = date
    end

    def all
      return [] unless offer?

      # TODO: Define a valid solution..

      (work_hours - reserved_hours).sort
    end

    def offer?
      !offer.nil?
    end

    private

    def work_hours
      (7..20).map { |hour| "#{hour}:00 #{date}" }
    end

    def reserved_hours
      Booking.joins('JOIN OFFERS ON OFFERS.ID = BOOKINGS.OFFER_ID')
             .where('OFFERS.MEMBER_ID = ?', member.id)
             .where("BOOKINGS.reserved_at::DATE >= '#{date}'")
             .where("BOOKINGS.reserved_at::DATE <= '#{date}'")
             .pluck('to_char(reserved_at, \'HH:MM YYYY-MM-DD\')')
    end
  end
end
