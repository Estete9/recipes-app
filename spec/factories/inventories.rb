FactoryBot.define do
  factory :inventory do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }

    association :user
  end
end
