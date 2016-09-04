# :nodoc:
module OffersHelper
  def format_price(offer)
    '%.2f BGN' % offer.price if offer.price.present?
  end
end
