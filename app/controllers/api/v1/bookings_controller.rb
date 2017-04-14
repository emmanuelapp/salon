module Api
  module V1
    class BookingsController < ActionController::API
      def create
        @booking = Booking.new(booking_params)

        if @booking.save
          render json: { success: 'Reservation saved!' }, status: 200
        else
          render json: { error: 'An error occured' }, status: 422
        end
      end

      private

      def booking_params
        params.require(:booking).permit(
          :first_name,
          :last_name,
          :additional_info,
          :phone,
          :reserved_at
        )
      end
    end
  end
end
