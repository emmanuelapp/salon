module Queries
  # The class Queries::BookingsByWeeks is responsible for
  # showing an excerpt of bookings on the basis of year and
  # week. year is expected as a four-digit number and
  # week is expected as the integer that represents
  # a given week (by the ISO-8601 standard).
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
      excerpt.group_by { |booking| booking.reserved_at.to_date }.to_a
    end

    private

    def excerpt
      @excerpt ||= Booking.includes(:offer).confirmed.by_week(week, year)
    end
  end
end
