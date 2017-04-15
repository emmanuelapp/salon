FactoryGirl.define do
  factory :member do
    first_name 'Jack'
    last_name 'Daniels'
    profession 'Health care practitioner'
    description 'Lorem ipsum bla bla bla'
    slug { |n| "asdas2314#{n}" }
  end
end
