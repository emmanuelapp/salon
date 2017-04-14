module Queries
  class ReservationDates
    attr_reader :date

    def self.all
      new(Date.today).all
    end

    def initialize(date)
      @date = date
    end

    def all
      # TODO: Define a valid solution..
      (work_hours - reserved_hours).sort
    end

    private

    def work_hours
      (7..20).map { |hour| "#{hour}:00 #{date}" }
    end

    def reserved_hours
      Booking.where("BOOKINGS.reserved_at::DATE >= '#{date}' AND BOOKINGS.reserved_at::DATE <= '#{date}'")
             .pluck('to_char(reserved_at, \'HH:MM YYYY-MM-DD\')')
    end
  end
end
