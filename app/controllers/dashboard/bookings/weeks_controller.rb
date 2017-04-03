module Dashboard
  module Bookings
    class WeeksController < AdminController
      def show
        week = params[:week_number]
        year = params[:booking_year]

        @bookings = Booking.by_week(week, year).by_days

        render component: 'WeekBoard', props: { daily_bookings: @bookings }
      end

      def index
        render plain: 'TODO: Define a list of weeks'
      end

      def edit
        render plain: 'TODO: Edit week bookings (as a kanban board)'
      end

      def update
        render plain: 'TODO: Edit week bookings (as a kanban board)'
      end
    end
  end
end
