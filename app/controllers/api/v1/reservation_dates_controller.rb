require_dependency './app/queries/reservation_dates'

module Api
  module V1
    class ReservationDatesController < ActionController::API
      def index
        render json: { available: ::Queries::ReservationDates.all }
      end
    end
  end
end
