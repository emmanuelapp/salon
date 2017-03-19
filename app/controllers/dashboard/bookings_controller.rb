module Dashboard
  # :nodoc:
  class BookingsController < AdminController
    def index
      render component: 'BookingsBoard', props: {
        approved: Booking.approved.order_by_desc,
        not_approved: Booking.not_approved.order_by_desc
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
