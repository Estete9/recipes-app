FactoryBot.define do
  factory :food_recipe do
    quantity { Faker::Number.between(from: 1, to: 10) }

    # Assuming you have associated recipes and foods factories
    association :recipe
    association :food
  end
end
