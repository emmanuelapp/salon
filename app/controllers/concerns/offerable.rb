module Offerable
  def index
    @offers = Offer.all
  end
end
