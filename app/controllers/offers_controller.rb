class OffersController < ApplicationController
  def index
    @offers = Offer.includes(:member)
  end
end
