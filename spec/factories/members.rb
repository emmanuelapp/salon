FactoryGirl.define do
  factory :member do
    first_name 'Jack'
    last_name 'Daniels'
    profession 'Health care practitioner'
    description 'Lorem ipsum bla bla bla'
  end

  factory :invalid_member, class: Member do
    first_name 'Jack'
  end
end
