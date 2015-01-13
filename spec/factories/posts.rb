FactoryGirl.define do

  factory :post do
    title Faker::Lorem.word
    body Faker::Lorem.paragraph


    trait :with_comments do
      after(:create) do |post, ussser|
        create_list(:comment, 5, post: post)
      end
    end
  end
end
