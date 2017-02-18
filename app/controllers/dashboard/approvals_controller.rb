module Dashboard
  # This controller holds the responsibility of changing
  # the flag Booking#approved to true. TODO: Define a controller
  # which handles both approvals and cancellations.
  class ApprovalsController < AdminController
    before_action :find_booking, only: :create

    def create
      @booking.approved = true

      if @booking.save
        flash[:notice] = t(:booking_approved)
      else
        flash[:error] = t(:something_went_wrong)
      end

      redirect_to dashboard_booking_path(@booking)
    end

    def find_booking
      @booking = Booking.find(params[:booking_id])
    end
  end
end
