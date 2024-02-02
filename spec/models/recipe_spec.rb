require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is valid with valid attributes' do
    recipe = build(:recipe)
    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe = build(:recipe, name: nil)
    expect(recipe).to_not be_valid
  end

  it 'belongs to a user' do
    association = Recipe.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end
end
