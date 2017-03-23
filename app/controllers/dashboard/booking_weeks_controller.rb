module Dashboard
  # :nodoc:
  class BookingWeeksController < AdminController
    def index
      render component: 'BookingWeek', props: { this_week: Booking.this_week }
    end
  end
end
