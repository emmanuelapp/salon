module Dashboard
  # :nodoc:
  class BookingsController < AdminController
    def index
      render component: 'BookingsBoard', props: {
        confirmed: Booking.confirmed.order_by_desc,
        pending: Booking.pending.order_by_desc
      }
    end

    def new
      # TODO
    end

    def create
      # TODO
    end

    def show
      @booking = Booking.find(params[:id])
    end

    def edit
      # TODO
    end

    def update
      # TODO
    end

    def destroy
      # TODO
    end
  end
end
