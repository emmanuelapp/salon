require_dependency './app/queries/reservation_dates'

module Api
  module V1
    class ReservationDatesController < ApiController
      def index
        query = ::Queries::ReservationDates.new(params[:offer_id])

        render json: { available: query.all }, status: 200
      end
    end
  end
end
