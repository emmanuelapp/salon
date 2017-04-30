module Api
  module V1
    class BookingsController < ApiController
      def create
        @booking = Booking.new(booking_params)

        if @booking.save
          render json: { success: 'Reservation saved!' }, status: 200
        else
          errors = @booking.errors.full_messages.to_sentence
          render json: { error: errors }, status: 422
        end
      end

      private

      def booking_params
        params.require(:booking).permit(
          :first_name,
          :last_name,
          :additional_info,
          :phone,
          :reserved_at,
          :offer_id
        )
      end
    end
  end
end
