module Queries
  # Makes an inner join between offers and members
  module OfferMember
    module_function

    def all
      Offer.select(*attributes).joins(:member)
    end

    def attributes
      %w[
        offers.id
        offers.name
        offers.price
        members.first_name
        members.last_name
      ]
    end
  end
end
