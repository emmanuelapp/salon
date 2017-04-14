module Queries
  # Makes an inner join between offers and members
  module OfferMember
    module_function

    def all
      ActiveRecord::Base.connection.execute(
        'SELECT OFFERS.ID,
                OFFERS.NAME,
                MEMBERS.FIRST_NAME,
                MEMBERS.LAST_NAME,
                OFFERS.PRICE
         FROM OFFERS
         JOIN MEMBERS ON MEMBERS.ID = OFFERS.MEMBER_ID'
      )
    end
  end
end
