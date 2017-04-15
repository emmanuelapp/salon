# :nodoc:
module OffersHelper
  def format_price(offer)
    '%.2f BGN' % offer.price
  end

  def selection_tuples
    Member.all.map { |m| [m.full_name, m.id] }
  end
end
