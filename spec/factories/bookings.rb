FactoryGirl.define do
  factory :booking do
    first_name 'Jack'
    last_name 'Daniels'
    phone '000000000000'
    confirmed false
    additional_info 'Lorem Ipsum'
    reserved_at Date.tomorrow
    offer_ids []

    trait :with_offer_ids do
      offer_ids [1, 2, 3]
    end

    factory :booking_with_offer_ids, traits: [:with_offer_ids]
  end
end
