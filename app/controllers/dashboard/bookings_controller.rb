module Dashboard
  # :nodoc:
  class BookingsController < AdminController
    def index
      @confirmed = Booking.confirmed.desc_order
      @pending = Booking.pending.desc_order
    end

    def show
      @booking = Booking.find(params[:id])
    end
  end
end
