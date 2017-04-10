FactoryGirl.define do
  factory :offer do
    trait :with_price do
      price 12.22
    end

    trait :with_name do
      name 'Relaxing massage'
    end

    factory :offer_with_name_and_price, traits: [:with_price, :with_name]
  end
end
