class OffersController < ApplicationController
  def index
    @offers = Offer.all.includes(:member)
  end
end
