module Queries
  class BookingsByWeeks
    attr_reader :year, :week

    def self.where(week:, year:)
      new(year: year, week: week).all
    end

    def initialize(week:, year:)
      @week = week
      @year = year
    end

    def all
      Booking.includes(:offer)
             .where(confirmed: true)
             .by_week(week, year)
             .by_days
    end
  end
end
