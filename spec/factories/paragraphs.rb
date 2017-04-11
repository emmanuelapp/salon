FactoryGirl.define do
  factory :paragraph do
    trait :with_title do
      title 'A title'
    end

    trait :with_body do
      body 'Content...'
    end

    factory :paragraph_with_data, traits: %i[with_body with_title]
  end
end
