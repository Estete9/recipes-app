FactoryBot.define do
  factory :food do
    name { Faker::Food.ingredient }
    measurement_unit { Faker::Food.metric_measurement }
    price { Faker::Number.decimal(l_digits: 2) }
    association :user
  end
end
