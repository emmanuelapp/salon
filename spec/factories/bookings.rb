FactoryBot.define do
  factory :booking do
    first_name 'Jack'
    last_name 'Daniels'
    phone '000000000000'
    confirmed false
    additional_info 'Lorem Ipsum'
    reserved_at Date.tomorrow
    offer { create(:offer) }
  end
end
