require_dependency './app/queries/bookings_by_weeks'

module Dashboard
  module Bookings
    class WeeksController < AdminController
      def show
        render component: 'WeekBoard', props: {
          daily_bookings: ::Queries::BookingsByWeeks.where(
            week: params[:week_number],
            year: params[:booking_year]
          )
        }
      end
    end
  end
end
