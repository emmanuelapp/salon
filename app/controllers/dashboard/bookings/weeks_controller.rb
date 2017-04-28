require_dependency './app/queries/bookings_by_weeks'

module Dashboard
  module Bookings
    class WeeksController < AdminController
      def show
        week = params[:week_number]
        year = params[:booking_year]

        @bookings = ::Queries::BookingsByWeeks.where(week: week, year: year)
      end
    end
  end
end
