module Dashboard
  module Bookings
    class WeeksController < AdminController
      def show
        week = params[:week_number]
        year = params[:booking_year]

        # START TODO: Extract
        @bookings = Booking.includes(:reservations)
                           .includes(:offers)
                           .by_week(week, year)
                           .by_days

        # Show only confirmed Bookings
        # END TODO

        render component: 'WeekBoard', props: { daily_bookings: @bookings }
      end
    end
  end
end
