require_dependency './app/queries/offer_member'

module Api
  module V1
    # :nodoc:
    class OffersController < ActionController::API
      def index
        render json: ::Queries::OfferMember.all
      end
    end
  end
end
