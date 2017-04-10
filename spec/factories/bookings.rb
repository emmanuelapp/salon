FactoryGirl.define do
  factory :booking do
    first_name 'Jack'
    last_name 'Daniels'
    phone '000000000000'
    approved false
    additional_info 'Lorem Ipsum'
    reserved_at Date.tomorrow
    offer_ids [1, 2, 3]
  end
end
