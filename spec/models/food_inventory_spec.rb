require 'rails_helper'

RSpec.describe FoodInventory, type: :model do
  let(:user) { create(:user) }
  let(:inventory) { create(:inventory, user:) }
  let(:food) { create(:food, user:) }

  it 'is valid with valid attributes' do
    food_inventory = create(:food_inventory, inventory:, food:)
    expect(food_inventory).to be_valid
  end

  it 'is not valid without a quantity' do
    food_inventory = build(:food_inventory, quantity: nil, inventory:, food:)
    expect(food_inventory).to_not be_valid
  end

  it 'belongs to an inventory' do
    association = FoodInventory.reflect_on_association(:inventory)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a food' do
    association = FoodInventory.reflect_on_association(:food)
    expect(association.macro).to eq(:belongs_to)
  end
end
