# :nodoc:
module OffersHelper
  def format_price(offer)
    '%.2f BGN' % offer.price
  end
end
