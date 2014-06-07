require 'ffaker'

FactoryGirl.define do
  factory :proposal do
    title Faker::Lorem.sentence[10..30]
    description Faker::Lorem.paragraphs.join("\n\n")
    category_list ApplicationHelper::CATEGORIES.sample
    user

    factory :invalid_proposal do
      title nil
    end
  end
end
