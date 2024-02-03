require 'rails_helper'

RSpec.describe FoodRecipe, type: :model do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let(:food) { create(:food, user:) }

  it 'is valid with valid attributes' do
    food_recipe = create(:food_recipe, recipe:, food:)
    expect(food_recipe).to be_valid
  end

  it 'belongs to an recipe' do
    association = FoodRecipe.reflect_on_association(:recipe)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a food' do
    association = FoodRecipe.reflect_on_association(:food)
    expect(association.macro).to eq(:belongs_to)
  end
end
