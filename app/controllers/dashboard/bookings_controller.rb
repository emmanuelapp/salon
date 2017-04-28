module Dashboard
  # :nodoc:
  class BookingsController < AdminController
    def index
      @confirmed = Booking.confirmed.order_by_desc
      @pending = Booking.pending.order_by_desc
    end

    def show
      @booking = Booking.find(params[:id])
    end
  end
end
