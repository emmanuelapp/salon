module Api
  module V1
    # :nodoc:
    class OffersController < ActionController::API
      def index
        render json: Offer.all
      end
    end
  end
end
