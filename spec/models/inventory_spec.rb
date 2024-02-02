require 'rails_helper'

RSpec.describe Inventory, type: :model do
   it 'is valid with valid attributes' do
    inventory = build(:inventory)
    expect(inventory).to be_valid
  end

  it 'is not valid without a name' do
    inventory = build(:inventory, name: nil)
    expect(inventory).to_not be_valid
  end

  # it 'has many food_inventories' do
  #   association = Inventory.reflect_on_association(:food_inventories)
  #   expect(association.macro).to eq(:has_many)
  # end

  it 'belongs to a user' do
    association = Inventory.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  # it 'has many foods through food_inventories' do
  #   association = Inventory.reflect_on_association(:foods)
  #   expect(association.macro).to eq(:has_many)
  #   expect(association.options[:through]).to eq(:food_inventories)
  # end
end
