FactoryGirl.define do
  factory :property do
    street { Faker::Lorem.word }
    city { Faker::Lorem.word }
  end
end
